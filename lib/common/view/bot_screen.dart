import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/user/model/update_order_body.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:korea_invest/user/provider/user_provider.dart';

const List<String> list = <String>['1. 거래량 단타', 'Two', 'Three', 'Four'];

class BotScreen extends ConsumerStatefulWidget {
  const BotScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends ConsumerState<BotScreen> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider.notifier);
    final state = user.state;
    if (state is! UserModel) {
      user.logout();
      return CircularProgressIndicator();
    }
    bool switchValue = state.orderid == 0 ? false : true;
    return DefaultLayout(
      title: '자동 매매 ON/OFF',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownMenu<String>(
            initialSelection: list.first,
            onSelected: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
          Image.asset('asset/aws_image.png'),
          CupertinoSwitch(
            // This bool value toggles the switch.
            value: switchValue,
            activeColor: CupertinoColors.activeBlue,
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.
              if(switchValue == true){
                user.updateOrder(state.id, UpdateOrderBody(orderid: 0));
                user.getMe();
                return;
              }
              else if (dropdownValue == '1. 거래량 단타') {
                user.updateOrder(state.id, UpdateOrderBody(orderid: 1));
                user.getMe();
              }
            },
          ),
        ],
      ),
    );
  }
}
