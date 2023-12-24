// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResModel _$OrderResModelFromJson(Map<String, dynamic> json) =>
    OrderResModel(
      rt_cd: json['rt_cd'] as String,
      msg_cd: json['msg_cd'] as String,
      msg1: json['msg1'] as String,
      output: json['output'] == null
          ? null
          : OrderOutput.fromJson(json['output'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResModelToJson(OrderResModel instance) =>
    <String, dynamic>{
      'rt_cd': instance.rt_cd,
      'msg_cd': instance.msg_cd,
      'msg1': instance.msg1,
      'output': instance.output,
    };

OrderOutput _$OrderOutputFromJson(Map<String, dynamic> json) => OrderOutput(
      ODNO: json['ODNO'] as String,
      ORD_TMD: json['ORD_TMD'] as String,
    );

Map<String, dynamic> _$OrderOutputToJson(OrderOutput instance) =>
    <String, dynamic>{
      'ODNO': instance.ODNO,
      'ORD_TMD': instance.ORD_TMD,
    };
