
import 'package:flutter/material.dart';
import 'package:korea_invest/account/view/account_view.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/common/view/bot_screen.dart';
import 'package:korea_invest/korea/view/search_screen.dart';
import 'package:korea_invest/korea/view/stock_price_view.dart';
import 'package:korea_invest/korea/view/stock_quotation_view.dart';
import 'package:korea_invest/user/view/user_page.dart';

import '../const/colors.dart';

class RootTab extends StatefulWidget {
  static String get routeName => 'home';
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              BotScreen(),
              SearchScreen(),
              AccountView(),
              UserPage(),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: '매매',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: '현재 시세',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: '내 정보',
          ),
        ],
      ),
    );
  }
}
