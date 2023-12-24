import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/korea/view/search_screen.dart';
import 'package:korea_invest/korea/view/stock_price_view.dart';

import '../hive/model/code_model.dart';

class StockDatabase extends StatefulWidget {
  const StockDatabase({Key? key}) : super(key: key);

  @override
  State<StockDatabase> createState() => _StockDatabaseState();
}

class _StockDatabaseState extends State<StockDatabase> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //addDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }




}
