
import 'package:json_annotation/json_annotation.dart';


part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String rt_cd;
  final String msg_cd;
  final String msg1;
  final List<AccountOutput> output1;

  AccountModel({
    required this.rt_cd,
    required this.msg_cd,
    required this.msg1,
    required this.output1,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json)
  => _$AccountModelFromJson(json);
}

@JsonSerializable()
class AccountOutput {
  final String pdno;
  final String prdt_name;
  final String trad_dvsn_name;
  final String hldg_qty;
  final String pchs_avg_pric;
  final String pchs_amt;
  final String prpr;
  final String evlu_amt;
  final String evlu_pfls_amt;
  final String evlu_pfls_rt;

  AccountOutput({
    required this.pdno,
    required this.prdt_name,
    required this.trad_dvsn_name,
    required this.hldg_qty,
    required this.pchs_avg_pric,
    required this.pchs_amt,
    required this.prpr,
    required this.evlu_amt,
    required this.evlu_pfls_amt,
    required this.evlu_pfls_rt,
  });

  factory AccountOutput.fromJson(Map<String, dynamic> json)
  => _$AccountOutputFromJson(json);
}
