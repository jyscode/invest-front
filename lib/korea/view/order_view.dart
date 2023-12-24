import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:korea_invest/common/const/auth.dart';
import 'package:korea_invest/korea/model/order_res_model.dart';
import 'package:korea_invest/korea/model/post_order_body.dart';
import 'package:korea_invest/korea/provider/price_provider.dart';
import 'package:korea_invest/korea/repository/order_repository.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:korea_invest/user/provider/user_provider.dart';

import '../../common/const/data.dart';

class OrderView extends ConsumerWidget {
  final String code;

  const OrderView({
    required this.code,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceProvider);
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(price.toString()),
          ElevatedButton(onPressed: () => order(code, ref), child: Text('주문하기')),
        ],
      ),
    );
  }

  order(String code, WidgetRef ref) async {
    final OrderRepository repository = ref.read(orderRepositoryProvider);
    final price = ref.read(priceProvider);
    final user = ref.read(userProvider.notifier).state;

    if(user is UserModel){
      final res = await repository.order(
          body: PostOrderBody(
            CANO: user.account.toString(),
            ACNT_PRDT_CD: "01",
            PDNO: code,
            ORD_DVSN: "01",
            ORD_QTY: "1",
            ORD_UNPR: price.toString(),
          ));

    }


  }
}
