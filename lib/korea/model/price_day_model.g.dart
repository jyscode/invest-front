// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDayModel _$PriceDayModelFromJson(Map<String, dynamic> json) =>
    PriceDayModel(
      output: (json['output'] as List<dynamic>)
          .map((e) => PriceDayBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PriceDayModelToJson(PriceDayModel instance) =>
    <String, dynamic>{
      'output': instance.output,
    };

PriceDayBody _$PriceDayBodyFromJson(Map<String, dynamic> json) => PriceDayBody(
      stck_bsop_date: json['stck_bsop_date'] as String,
      stck_oprc: json['stck_oprc'] as String,
      stck_hgpr: json['stck_hgpr'] as String,
      stck_lwpr: json['stck_lwpr'] as String,
      stck_clpr: json['stck_clpr'] as String,
      acml_vol: json['acml_vol'] as String,
    );

Map<String, dynamic> _$PriceDayBodyToJson(PriceDayBody instance) =>
    <String, dynamic>{
      'stck_bsop_date': instance.stck_bsop_date,
      'stck_oprc': instance.stck_oprc,
      'stck_hgpr': instance.stck_hgpr,
      'stck_lwpr': instance.stck_lwpr,
      'stck_clpr': instance.stck_clpr,
      'acml_vol': instance.acml_vol,
    };
