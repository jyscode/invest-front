import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/const/auth.dart';
import 'package:korea_invest/user/model/login_response.dart';
import 'package:korea_invest/user/model/post_sign_body.dart';
import 'package:korea_invest/user/model/update_order_body.dart';
import 'package:korea_invest/user/model/update_user_body.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:retrofit/http.dart';

import '../../common/dio/dio.dart';

part 'user_repository.g.dart';

final userRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final repository = UserRepository(dio, baseUrl: HOST_IP);

  return repository;
});

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('/users/me')
  @Headers({
    'accessToken' : 'login',
  })
  Future<UserModel> getMe();


  @POST('/auth/register/email')
  Future<LoginResponse> signUp({
    @Body() required PostSignBody body,
  });

  @PATCH('/users/{id}')
  Future<void> updateUser({
    @Path() required int id,
    @Body() required UpdateUserBody body,
});
  
  @PATCH('/users/order/{id}')
  Future<void> updateOrder({
    @Path() required int id,
    @Body() required UpdateOrderBody orderid,
});


}
