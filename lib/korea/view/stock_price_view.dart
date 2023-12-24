import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/component/stock_card.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/hive/model/code_model.dart';
import 'package:korea_invest/korea/model/price_model.dart';
import 'package:korea_invest/korea/provider/price_provider.dart';
import 'package:korea_invest/korea/repository/stock_price_repository.dart';
import 'package:korea_invest/korea/view/ask_price_view.dart';
import 'package:korea_invest/korea/view/line_chart_sample2.dart';
import 'package:korea_invest/korea/view/order_view.dart';

class StockPriceView extends ConsumerWidget {
  static String get routeName => 'stock_price';
  final CodeModel model;

  const StockPriceView({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(stockPriceRepositoryProvider);
    final price = ref.watch(priceProvider);
    return DefaultLayout(
      title: model.name,
      child: FutureBuilder<PriceModel>(
        // fetchData(model.code.padLeft(6, "0")),
        future: ref.watch(stockPriceRepositoryProvider).getStockPrice(model.code.padLeft(6,"0")),
        builder: (BuildContext context, AsyncSnapshot<PriceModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            final PriceModel data = snapshot.data!;
             // ref.read(priceProvider.notifier).update((state) => int.parse(data.output.stck_prpr));
            return Column(
              children: [
                StockCard(model: data),
                Expanded(
                  child: LineChartSample2(repository: repository, code: model.code),
                ),
                Expanded(child: AskPriceView(code: model.code.padLeft(6,"0"))),
                IconButton(onPressed: (){
                  ref.read(priceProvider.notifier).update((state) => int.parse(data.output.stck_prpr));
                }, icon: Icon(Icons.refresh)),
                OrderView(code: model.code.padLeft(6,"0")),
              ],
            );
          }
        },
      ),
    );
  }

  Future<PriceModel> fetchData(String code) async {
    final dio = Dio();

    final repository = StockPriceRepository(dio, baseUrl: "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations");

    return repository.getStockPrice(code);
    // final access_token = await storage.read(key: ACCESS_TOKEN_KEY);
    // final String url =
    //     "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations/inquire-price?";
    // print(url);
    // final resp = await dio.get(
    //   url,
    //   queryParameters: {'fid_cond_mrkt_div_code': 'J', 'fid_input_iscd': code},
    //   options: Options(
    //     headers: {
    //       "content-type": CONTENT_TYPE,
    //       "authorization": access_token,
    //       "appkey": APPKEY,
    //       "appsecret": APPSCRETKEY,
    //       "tr_id": TR_ID,
    //     },
    //   ),
    // );
    //
    // return PriceModel.fromJson(resp.data);
  }
}
