import 'package:json_annotation/json_annotation.dart';

/*
* 전일, 시가, 고가, 저가, 거래량, 대금, 시총, 업종, 52주 최고, 52주 최저, PER, EPS
* */

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  final PriceBodyModel output;

  PriceModel({
    required this.output,
  });
  factory PriceModel.fromJson(Map<String, dynamic> json)
  => _$PriceModelFromJson(json);
}

@JsonSerializable()
class PriceBodyModel {
  // 시가
  final String stck_oprc;

  // 현재가
  final String stck_prpr;

  // 고가
  final String stck_hgpr;

  // 저가
  final String stck_lwpr;

  PriceBodyModel({
    required this.stck_oprc,
    required this.stck_hgpr,
    required this.stck_prpr,
    required this.stck_lwpr,
  });

  factory PriceBodyModel.fromJson(Map<String, dynamic> json)
  => _$PriceBodyModelFromJson(json);
}
