// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_order_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostOrderBody _$PostOrderBodyFromJson(Map<String, dynamic> json) =>
    PostOrderBody(
      CANO: json['CANO'] as String,
      ACNT_PRDT_CD: json['ACNT_PRDT_CD'] as String,
      PDNO: json['PDNO'] as String,
      ORD_DVSN: json['ORD_DVSN'] as String,
      ORD_QTY: json['ORD_QTY'] as String,
      ORD_UNPR: json['ORD_UNPR'] as String,
    );

Map<String, dynamic> _$PostOrderBodyToJson(PostOrderBody instance) =>
    <String, dynamic>{
      'CANO': instance.CANO,
      'ACNT_PRDT_CD': instance.ACNT_PRDT_CD,
      'PDNO': instance.PDNO,
      'ORD_DVSN': instance.ORD_DVSN,
      'ORD_QTY': instance.ORD_QTY,
      'ORD_UNPR': instance.ORD_UNPR,
    };
