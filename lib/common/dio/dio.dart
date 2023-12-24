// Dio Interceptor
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:korea_invest/common/const/auth.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/user/provider/auth_provider.dart';
import 'package:korea_invest/user/provider/user_provider.dart';

import '../../user/model/user_model.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(CustomInterceptor(storage: storage, ref: ref));

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;

  CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  // 1) 요청 보낼 때
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    // options.method : GET, POST, PUT 등 보내는 방식
    // options.uri : 요청을 보낸 uri 주소
    print('[REQ] [${options.method}] ${options.uri}');

    if (options.headers['accessToken'] == 'login') {
      options.headers.remove('accessToken');

      final token = await storage.read(key: LOGIN_ACCESS_KEY);

      print(token);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    // 실제 토큰으로 대체
    if (options.headers['accessToken'] == 'true') {
      final user = ref.read(authProvider.notifier).getMe();
      if(user is !UserModel){
        return handler.reject(DioException(requestOptions: RequestOptions()));
      }
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      print(token);

      options.headers.addAll({
        "content-type": CONTENT_TYPE,
        "authorization": token,
        "appkey": user.apikey,
        "appsecret": user.apisecret,
      });

      if (options.headers['tr_id'] == TR_DAY ||
          options.headers['tr_id'] == TR_ID ||
          options.headers['tr_id'] == TR_ASK) {
        options.queryParameters.addAll({'fid_cond_mrkt_div_code': 'J'});
      }

      if (options.headers['tr_id'] == TR_DAY) {
        options.queryParameters.addAll({
          'fid_period_div_code': 'D',
          'fid_org_adj_prc': 1,
        });
      }
      else if (options.headers['tr_id'] == TR_ACCOUNT) {
        options.queryParameters.addAll({
          'CANO': user.account,
          'ACNT_PRDT_CD': '01',
          'AFHR_FLPR_YN': 'N',
          'OFL_YN': '',
          'INQR_DVSN': '01',
          'UNPR_DVSN': '01',
          'FUND_STTL_ICLD_YN': 'N',
          'FNCG_AMT_AUTO_RDPT_YN': 'N',
          'PRCS_DVSN': '00',
          'CTX_AREA_FK100': '',
          'CTX_AREA_NK100': '',

        });
      }

      print('[REQ] [${options.method}] ${options.uri}');
    }
    return super.onRequest(options, handler);
  }

  // 2) 요청 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[RES] [${response.requestOptions.method}] ${response.requestOptions
        .uri}');

    return super.onResponse(response, handler);
  }


  // 3) 에러가 났을 때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');


    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final loginAccess = await storage.read(key: LOGIN_ACCESS_KEY);
    final loginRefresh = await storage.read(key: LOGIN_REFRESH_KEY);

    if (loginAccess == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/token/access';
    print(err.requestOptions.path);
    final isStatus500 = err.response?.statusCode == 500;
    print(err.response?.statusCode);
    print(err.response?.data);


    if (isStatus401 && !isPathRefresh) {
      try {
        print('Token Refresh');
        final ip = HOST_IP;
        final dio = Dio();
        final resp = await dio.post(
          '$ip/auth/token/access',
          options: Options(
              headers: {
                'authorization': 'Bearer $loginRefresh',
              }
          ),
        );
        final login_acc = resp.data['accessToken'];
        await storage.write(key: LOGIN_ACCESS_KEY, value: login_acc);
        final options = err.requestOptions;
        options.headers.addAll({
          'authorization': 'Bearer $login_acc',
        });
        final response = await dio.fetch(options);

        print('토큰 재발급 성공');
        return handler.resolve(response);
      } catch(e){
        ref.read(userProvider.notifier).logout();
        handler.reject(err);
      }
    }

    // EGW00123 기간이 만료된 토큰 혹은 토큰이 없을 때
    if (isStatus500 && err.response?.data['msg_cd'] == 'EGW00123' || accessToken == null) {
      try {
        final user = ref.read(authProvider.notifier).getMe();
        const ip = "https://openapi.koreainvestment.com:9443";
        final dio = Dio();
        final resp = await dio.post(
          '$ip/oauth2/tokenP',
          data: {
            "grant_type": GRANT_TYPE,
            "appkey": user.apikey,
            "appsecret": user.apisecret,
          },
          options: Options(
            headers: {
              'content-type': CONTENT_TYPE,
            },
          ),
        );
        final access_token = 'Bearer ${resp.data['access_token']}';
        final expire = resp.data['access_token_token_expired'];

        await storage.write(key: ACCESS_TOKEN_KEY, value: access_token);
        await storage.write(key: EXPIRE_DATE, value: expire);

        print('save : ${access_token}');
        final options = err.requestOptions;

        options.headers.addAll({
          'authorization': access_token
        });

        // 요청 재전송
        final response = await dio.fetch(options);

        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }
    // TODO: implement onError
    super.onError(err, handler);
  }
}




