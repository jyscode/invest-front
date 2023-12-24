import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/dio/dio.dart';
import 'package:korea_invest/korea/model/post_order_body.dart';
import 'package:retrofit/http.dart';

import '../model/order_res_model.dart';

part 'order_repository.g.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return OrderRepository(dio, baseUrl: "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/trading");
});

@RestApi()
abstract class OrderRepository {
  factory OrderRepository(Dio dio, {String baseUrl}) = _OrderRepository;

  @POST('/order_cash')
  @Headers({
    'accessToken': 'true',
    'tr_id':'TTTC0802U'
  })
  Future<OrderResModel> order({
    @Body() required PostOrderBody body,
  });
}
