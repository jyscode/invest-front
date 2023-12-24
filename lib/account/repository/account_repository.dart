


import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/account/model/account_model.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:retrofit/http.dart';

import '../../common/dio/dio.dart';

part 'account_repository.g.dart';

final accountRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final repository = AccountRepository(dio,
      baseUrl:
      "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/trading");

  return repository;
} );


@RestApi()
abstract class AccountRepository{
  // baseUrl: https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/trading/
  factory AccountRepository(Dio dio, {String baseUrl}) = _AccountRepository;

  @GET('/inquire-balance')
  @Headers({'accessToken': 'true', 'tr_id': TR_ACCOUNT})
  Future<AccountModel> getAccount();

}