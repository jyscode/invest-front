import 'package:flutter/material.dart';
import 'package:korea_invest/account/model/account_model.dart';

class AccountCard extends StatelessWidget {
  final AccountOutput output;
  const AccountCard({
    required this.output,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool benefit = double.parse(output.pchs_avg_pric) >= double.parse(output.prpr);
    final benefitV = double.parse(output.prpr) * double.parse(output.hldg_qty) - double.parse(output.pchs_amt) ;
    return
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 10,
                height: 50,
                color: benefit ? Colors.red : Colors.blue,
              ),
              Text(output.prdt_name),
              Text(output.prpr),
              Text(output.pchs_avg_pric),
              Text(output.hldg_qty),
              Text(benefitV.round().toString()),
            ],
          ),
        );


  }
}
