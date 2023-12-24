import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:korea_invest/account/model/account_card.dart';
import 'package:korea_invest/account/repository/account_repository.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:korea_invest/user/provider/user_provider.dart';

import '../../common/const/data.dart';
import '../../korea/model/post_order_body.dart';
import '../../korea/repository/order_repository.dart';

class AccountView extends ConsumerWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(accountRepositoryProvider);
    return FutureBuilder(
      future: repository.getAccount(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
              width: 200.0,
              height: 200.0,
              child: Center(child: CircularProgressIndicator()));
        } else {
          final data = snapshot.data!;
          print(data.msg1);

          return SafeArea(
            top: true,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('이름'),
                  Text('현재가'),
                  Text('평균 매입가'),
                  Text('보유 수량'),
                  Text('총액'),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(height: 5,),
                  itemBuilder: (BuildContext context, int index) {
                    final val = data.output1[index];
                    return InkWell(
                      child: AccountCard(output:val),
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                          builder: ((context) {
                            return AlertDialog(
                              title: Text("매도"),
                              content: Text(val.prpr),
                              actions: <Widget>[
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.pop(); //창 닫기
                                    },
                                    child: Text("네"),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.pop(); //창 닫기
                                    },
                                    child: Text("아니요"),
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      },
                    );
                  },
                  itemCount: data.output1.length,
                ),
              ),
            ]),
          );
        }
      },
    );
  }

  order(String code, String price, WidgetRef ref) async {
    final OrderRepository repository = ref.read(orderRepositoryProvider);
    final storage = ref.read(secureStorageProvider);
    final user = ref.read(userProvider.notifier).state;

    if(user is UserModel){
      final res = await repository.order(
          body: PostOrderBody(
            CANO: user.account.toString(),
            ACNT_PRDT_CD: "01",
            PDNO: code,
            ORD_DVSN: "00",
            ORD_QTY: "1",
            ORD_UNPR: price,
          ));

    }



  }
}
