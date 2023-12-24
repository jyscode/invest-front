import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:korea_invest/common/component/custom_text_form.dart';
import 'package:korea_invest/common/const/auth.dart';
import 'package:korea_invest/common/const/colors.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/user/provider/user_provider.dart';
import 'package:korea_invest/user/view/sign_up_view.dart';

import '../../common/view/root_tab.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String get routeName => 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String username ='';
  String password ='';
  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // final emulatorIp = '10.0.2.2:3000';
    // final simulatorIp = '127.0.0.1:3000';
    //
    // final ip = Platform.isIOS ? emulatorIp : simulatorIp;

    const ip = "https://openapi.koreainvestment.com:9443";

    return DefaultLayout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/main_image.png'),
            CustomTextForm(
              onChanged: (String value) {
                username = value;
              },
              hintText: 'username',
            ),
            CustomTextForm(
              hintText: 'password',
              obscure: true,
              onChanged: (String value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                ref.read(userProvider.notifier).login(username: username, password: password);
                // final resp = await dio.post(
                //   '$ip/oauth2/tokenP',
                //   data: {
                //     "grant_type": GRANT_TYPE,
                //     "appkey": APPKEY,
                //     "appsecret": APPSCRETKEY,
                //   },
                //   options: Options(
                //     headers: {
                //       'content-type': CONTENT_TYPE,
                //     },
                //   ),
                // );
                // final access_token = 'Bearer ${resp.data['access_token']}';
                // final expire = resp.data['access_token_token_expired'];
                //
                // final storage = ref.read(secureStorageProvider);
                //
                // await storage.write(key: ACCESS_TOKEN_KEY, value: access_token);
                // await storage.write(key: EXPIRE_DATE, value: expire);
                //
                // print('save : ${access_token}');
                //
                //  Navigator.of(context).push(
                //    MaterialPageRoute(builder: (_) => RootTab()),
                //  );
              },
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR,
              ),
              child: Text('로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> SignUpView()),
                );
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}