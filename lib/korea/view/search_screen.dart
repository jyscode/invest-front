import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/korea/view/stock_price_view.dart';

import '../../common/component/code_name_card.dart';
import '../../hive/model/code_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CodeNameCard> list = [];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '주식 현재가',
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                list = fetchSearch(text);
                setState(() {});
              },
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.goNamed(
                        StockPriceView.routeName,
                        extra: list.elementAt(index).model,
                      );
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (_) => StockPriceView(
                      //           model: list.elementAt(index).model)),
                      // );
                    },
                    child: list.elementAt(index),
                  );
                },
                itemCount: list.length,
              ),
            ),
          ],
        ));
  }

  fetchSearch(String name) {
    final Box<CodeModel> box = Hive.box<CodeModel>('code');
    final fList = box.values
        .where((element) => element.name.contains(name))
        .map((e) => CodeNameCard(
              model: e,
            ))
        .toList();

    return fList;
  }
}
