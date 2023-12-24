import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/common/dio/dio.dart';
import 'package:korea_invest/korea/model/price_day_model.dart';
import 'package:korea_invest/korea/model/price_model.dart';
import 'package:retrofit/http.dart';

part 'stock_price_repository.g.dart';

final stockPriceRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final repository = StockPriceRepository(dio,
      baseUrl:
          "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations");

  return repository;
});

@RestApi()
abstract class StockPriceRepository {
  factory StockPriceRepository(Dio dio, {String baseUrl}) =
      _StockPriceRepository;

  @GET('/inquire-price')
  @Headers({'accessToken': 'true', 'tr_id': TR_ID})
  Future<PriceModel> getStockPrice(
    @Query("fid_input_iscd") String code,
  );

  @GET('/inquire-daily-price')
  @Headers({'accessToken': 'true', 'tr_id': TR_DAY})
  Future<PriceDayModel> getStockPriceDay(
    @Query("fid_input_iscd") String code,
  );
}
