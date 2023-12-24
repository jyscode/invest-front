import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:korea_invest/common/const/auth.dart';
import 'package:korea_invest/common/dio/dio.dart';

import '../model/login_response.dart';
import '../model/token_response.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRepository(baseUrl: HOST_IP, dio: dio);
});
class AuthRepository {
  final String baseUrl;
  final Dio dio;

  AuthRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final serialized = stringToBase64.encode('$username:$password');
    final resp = await dio.post(
      '$baseUrl/auth/login/email',
      options: Options(
        headers: {
          'authorization': 'Basic $serialized',
        }
      ),
    );

    return LoginResponse.fromJson(resp.data);
  }

  Future<TokenResponse> token() async {
    final resp = await dio.post(
      '$baseUrl/token',
      options: Options(
        headers: {
          'refresh' : 'true',
        }
      )
    );
    
    return TokenResponse.fromJson(resp.data);
  }
}
