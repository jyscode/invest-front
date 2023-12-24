import 'package:json_annotation/json_annotation.dart';
import 'package:korea_invest/korea/model/price_model.dart';

part 'price_day_model.g.dart';

@JsonSerializable()
class PriceDayModel {
  final List<PriceDayBody> output;

  PriceDayModel({
    required this.output,
  });

  factory PriceDayModel.fromJson(Map<String, dynamic> json) =>
      _$PriceDayModelFromJson(json);
}

@JsonSerializable()
class PriceDayBody {
  // 거래일자
  final String stck_bsop_date;

  // 시가
  final String stck_oprc;

  // 최고가
  final String stck_hgpr;
  // 최저가
  final String stck_lwpr;
  // 종가
  final String stck_clpr;
  // 누적 거래량
  final String acml_vol;

  PriceDayBody({
    required this.stck_bsop_date,
    required this.stck_oprc,
    required this.stck_hgpr,
    required this.stck_lwpr,
    required this.stck_clpr,
    required this.acml_vol
  });

  factory PriceDayBody.fromJson(Map<String, dynamic> json)
  => _$PriceDayBodyFromJson(json);
}
