// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      rt_cd: json['rt_cd'] as String,
      msg_cd: json['msg_cd'] as String,
      msg1: json['msg1'] as String,
      output1: (json['output1'] as List<dynamic>)
          .map((e) => AccountOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'rt_cd': instance.rt_cd,
      'msg_cd': instance.msg_cd,
      'msg1': instance.msg1,
      'output1': instance.output1,
    };

AccountOutput _$AccountOutputFromJson(Map<String, dynamic> json) =>
    AccountOutput(
      pdno: json['pdno'] as String,
      prdt_name: json['prdt_name'] as String,
      trad_dvsn_name: json['trad_dvsn_name'] as String,
      hldg_qty: json['hldg_qty'] as String,
      pchs_avg_pric: json['pchs_avg_pric'] as String,
      pchs_amt: json['pchs_amt'] as String,
      prpr: json['prpr'] as String,
      evlu_amt: json['evlu_amt'] as String,
      evlu_pfls_amt: json['evlu_pfls_amt'] as String,
      evlu_pfls_rt: json['evlu_pfls_rt'] as String,
    );

Map<String, dynamic> _$AccountOutputToJson(AccountOutput instance) =>
    <String, dynamic>{
      'pdno': instance.pdno,
      'prdt_name': instance.prdt_name,
      'trad_dvsn_name': instance.trad_dvsn_name,
      'hldg_qty': instance.hldg_qty,
      'pchs_avg_pric': instance.pchs_avg_pric,
      'pchs_amt': instance.pchs_amt,
      'prpr': instance.prpr,
      'evlu_amt': instance.evlu_amt,
      'evlu_pfls_amt': instance.evlu_pfls_amt,
      'evlu_pfls_rt': instance.evlu_pfls_rt,
    };
