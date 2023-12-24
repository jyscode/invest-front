import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/korea/repository/ask_price_repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AskPriceView extends ConsumerStatefulWidget {
  final String code;

  const AskPriceView({
    required this.code,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AskPriceView> createState() => _AskPriceViewState();
}

class _AskPriceViewState extends ConsumerState<AskPriceView> {
  @override
  Widget build(BuildContext context) {
    final AskPriceRepository repository = ref.watch(askPriceRepositoryProvider);

    return FutureBuilder(
      future: repository.getAskPrice(widget.code),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          final data = snapshot.data!;
          final List<String> askp = [
            data.output1.askp_rsqn1,
            data.output1.askp_rsqn2,
            data.output1.askp_rsqn3,
            data.output1.askp_rsqn4,
            data.output1.askp_rsqn5
          ];

          final askp_rsqn_max =
              askp.map((e) => double.parse(e)).toList().reduce(max);
          final List<_ChartData> barData = [
            _ChartData(
                data.output1.askp1, double.parse(data.output1.askp_rsqn1)),
            _ChartData(
                data.output1.askp2, double.parse(data.output1.askp_rsqn2)),
            _ChartData(
                data.output1.askp3, double.parse(data.output1.askp_rsqn3)),
            _ChartData(
                data.output1.askp4, double.parse(data.output1.askp_rsqn4)),
            _ChartData(
                data.output1.askp5, double.parse(data.output1.askp_rsqn5)),
          ];
          final List<_ChartData> bid_barData = [
            _ChartData(
                data.output1.bidp1, double.parse(data.output1.bidp_rsqn1)),
            _ChartData(
                data.output1.bidp2, double.parse(data.output1.bidp_rsqn2)),
            _ChartData(
                data.output1.bidp3, double.parse(data.output1.bidp_rsqn3)),
            _ChartData(
                data.output1.bidp4, double.parse(data.output1.bidp_rsqn4)),
            _ChartData(
                data.output1.bidp5, double.parse(data.output1.bidp_rsqn5)),
          ];

          return ListView(
            children: [
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // isVisible 네모난 간격 칸 없애기
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  isVisible: false,
                ),
                series: <ChartSeries<_ChartData, String>>[
                  BarSeries<_ChartData, String>(
                      isTrackVisible: true,
                      dataSource: barData,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      color: Color.fromRGBO(8, 142, 255, 1)),
                ],
                tooltipBehavior: TooltipBehavior(
                    enable: true, canShowMarker: false, header: ''),
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // isVisible 네모난 간격 칸 없애기
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  isVisible: false,
                ),
                series: <ChartSeries<_ChartData, String>>[
                  BarSeries<_ChartData, String>(
                      isTrackVisible: true,
                      dataSource: bid_barData,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      color: Colors.red[200]),
                ],
                tooltipBehavior: TooltipBehavior(
                    enable: true, canShowMarker: false, header: ''),
              )
            ],
          );
        }
      },
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
