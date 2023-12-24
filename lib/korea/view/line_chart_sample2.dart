import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:korea_invest/common/const/colors.dart';
import 'package:korea_invest/korea/model/price_day_model.dart';
import 'package:collection/collection.dart';
import 'package:korea_invest/korea/repository/stock_price_repository.dart';

class LineChartSample2 extends StatefulWidget {
  final String code;
  final StockPriceRepository repository;

  const LineChartSample2({
    required this.repository,
    required this.code,
    super.key,
  });

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  bool showAvg = false;






  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.repository.getStockPriceDay(widget.code.padLeft(6, '0')),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        PriceDayModel model = snapshot.data!;
        List<String> date = model.output.map((e) => e.stck_bsop_date).toList();
        Map<int,String> dateMap = date.asMap();
        print(dateMap);
        // final dates = date.mapIndexed((index, element) => {'index':index, 'date': element}).toList();
        List<String> value = model.output.map((e) => e.stck_clpr).toList();
        print(value);
        return Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  // showAvg ? avgData(value) : mainData(date, value),
                  mainData(date, value),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bottomTitleWidgets(double date, TitleMeta meta) {
    DateTime now = DateTime.now();
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    text = Text(date.toString(), style: style,);

    DateTime time = now.subtract(Duration(days: -(date.toInt() - 29)));
    String timeStr = '${time.month}/${time.day}';
    text = Text(timeStr, style: style,);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;


    text = value.toInt().toString();

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(List<String> date, List<String> value) {
    List<double> douVal = value.map((e) => double.parse(e)).toList();
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        //horizontalInterval: 1,
        //verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            //interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: (douVal.reduce(max) - douVal.reduce(min)) /2,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: value.length.toDouble() - 1,
      minY: douVal.reduce(min) * 0.9,
      maxY: douVal.reduce(max) * 1.1,
      lineBarsData: [
        LineChartBarData(
          spots: value.mapIndexed((index, element) => FlSpot(index.toDouble(), double.parse(element))).toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // LineChartData avgData(List<String> value) {
  //   print(value.toString());
  //   List<int> intVal = value.map((e) => int.parse(e)).toList();
  //   double avg = intVal.reduce((value, element) => value+ element) / intVal.length;
  //   return LineChartData(
  //     lineTouchData: LineTouchData(enabled: false),
  //     gridData: FlGridData(
  //       show: true,
  //       drawHorizontalLine: true,
  //       // verticalInterval: 1,
  //       // horizontalInterval: 1,
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           reservedSize: 30,
  //           getTitlesWidget: bottomTitleWidgets,
  //           interval: 1,
  //         ),
  //       ),
  //       leftTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: leftTitleWidgets,
  //           reservedSize: 42,
  //           interval: 1,
  //         ),
  //       ),
  //       topTitles: AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       rightTitles: AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: true,
  //       border: Border.all(color: const Color(0xff37434d)),
  //     ),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: avg * 2,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots:  [
  //           FlSpot(0, avg),
  //           FlSpot(2.6, avg),
  //           FlSpot(4.9, avg),
  //           FlSpot(6.8, avg),
  //           FlSpot(8, avg),
  //           FlSpot(9.5, avg),
  //           FlSpot(11, avg),
  //         ],
  //         isCurved: true,
  //         gradient: LinearGradient(
  //           colors: [
  //             ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                 .lerp(0.2)!,
  //             ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                 .lerp(0.2)!,
  //           ],
  //         ),
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           gradient: LinearGradient(
  //             colors: [
  //               ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                   .lerp(0.2)!
  //                   .withOpacity(0.1),
  //               ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                   .lerp(0.2)!
  //                   .withOpacity(0.1),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
