import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/common/dio/dio.dart';
import 'package:korea_invest/korea/model/ask_price_model.dart';
import 'package:retrofit/http.dart';

part 'ask_price_repository.g.dart';

final askPriceRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final repository = AskPriceRepository(dio,
      baseUrl:
      "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations");

  return repository;
} );

@RestApi()
abstract class AskPriceRepository {
  factory AskPriceRepository(Dio dio, {String baseUrl}) = _AskPriceRepository;

  @GET('/inquire-asking-price-exp-ccn')
  @Headers({'accessToken': 'true', 'tr_id': TR_ASK})
  Future<AskPriceModel> getAskPrice(
    @Query("fid_input_iscd") String code,
  );


}
