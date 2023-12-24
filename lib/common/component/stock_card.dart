import 'package:flutter/material.dart';
import 'package:korea_invest/korea/model/price_model.dart';
import 'package:korea_invest/korea/view/line_chart_sample2.dart';

// 시가 , 현재, 고가, 저가
class StockCard extends StatelessWidget {
  final PriceModel model;

  const StockCard({
    required this.model, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('시가: ${model.output.stck_oprc}'),
            Text('현재가: ${model.output.stck_prpr}'),
            Text('고가: ${model.output.stck_hgpr}'),
            Text('저가: ${model.output.stck_lwpr}'),
          ],
        ),
      ),
    );
  }
}
