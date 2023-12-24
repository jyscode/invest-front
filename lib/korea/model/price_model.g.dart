// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      output: PriceBodyModel.fromJson(json['output'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'output': instance.output,
    };

PriceBodyModel _$PriceBodyModelFromJson(Map<String, dynamic> json) =>
    PriceBodyModel(
      stck_oprc: json['stck_oprc'] as String,
      stck_hgpr: json['stck_hgpr'] as String,
      stck_prpr: json['stck_prpr'] as String,
      stck_lwpr: json['stck_lwpr'] as String,
    );

Map<String, dynamic> _$PriceBodyModelToJson(PriceBodyModel instance) =>
    <String, dynamic>{
      'stck_oprc': instance.stck_oprc,
      'stck_prpr': instance.stck_prpr,
      'stck_hgpr': instance.stck_hgpr,
      'stck_lwpr': instance.stck_lwpr,
    };
