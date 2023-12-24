import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/user/model/update_order_body.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:korea_invest/user/repository/auth_repository.dart';

import '../repository/user_repository.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final repository = ref.watch(userRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);

  return UserStateNotifier(
    authRepository: authRepository,
    repository: repository,
    storage: storage,
  );
});

class UserStateNotifier extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;
  final UserRepository repository;
  final FlutterSecureStorage storage;

  UserStateNotifier({
    required this.authRepository,
    required this.repository,
    required this.storage,
  }) : super(UserModelLoading()) {
    // 내 정보 가져오기
    getMe();
  }

  getMe() async {
    final accessToken = await storage.read(key: LOGIN_ACCESS_KEY);
    final refreshToken = await storage.read(key: LOGIN_REFRESH_KEY);

    if (accessToken == null || refreshToken == null) {
      state = null;
      return;
    }

    final resp = await repository.getMe();

    state = resp;
  }

  Future<UserModelBase> login({
    required String username,
    required String password,
  }) async {
    try {
      state = UserModelLoading();
      final resp = await authRepository.login(
        username: username,
        password: password,
      );

      print(resp.accessToken);

      await storage.write(key: LOGIN_ACCESS_KEY, value: resp.accessToken);
      await storage.write(key: LOGIN_REFRESH_KEY, value: resp.refreshToken);

      final userResp = await repository.getMe();

      state = userResp;
      print(userResp.email);
      return userResp;
    } catch (e) {
      state = UserModelError(message: '로그인에 실패했습니다.');

      return Future.value(state);
    }
  }

  logout() async {
    state = null;

    storage.delete(key: LOGIN_ACCESS_KEY);
    storage.delete(key: LOGIN_REFRESH_KEY);

  }

  updateOrder(int id, UpdateOrderBody body) async {
    try{
      await repository.updateOrder(id: id, orderid: body);
    } catch(e){
      return null;
    }
  }
}
