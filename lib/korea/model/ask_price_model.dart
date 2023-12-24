import 'package:json_annotation/json_annotation.dart';

part 'ask_price_model.g.dart';

@JsonSerializable()
class AskPriceModel {
  final Output output1;

  AskPriceModel({
    required this.output1,
  });
  
  factory AskPriceModel.fromJson(Map<String, dynamic> json)
  => _$AskPriceModelFromJson(json);
}

@JsonSerializable()
class Output {
  // 매도 호가, 매수 호가, 매도 호가량, 매수 호가량
  final String askp1;
  final String askp2;
  final String askp3;
  final String askp4;
  final String askp5;
  final String bidp1;
  final String bidp2;
  final String bidp3;
  final String bidp4;
  final String bidp5;
  final String askp_rsqn1;
  final String askp_rsqn2;
  final String askp_rsqn3;
  final String askp_rsqn4;
  final String askp_rsqn5;
  final String bidp_rsqn1;
  final String bidp_rsqn2;
  final String bidp_rsqn3;
  final String bidp_rsqn4;
  final String bidp_rsqn5;

  Output({
    required this.askp1,
    required this.askp2,
    required this.askp3,
    required this.askp4,
    required this.askp5,
    required this.askp_rsqn1,
    required this.askp_rsqn2,
    required this.askp_rsqn3,
    required this.askp_rsqn4,
    required this.askp_rsqn5,
    required this.bidp1,
    required this.bidp2,
    required this.bidp3,
    required this.bidp4,
    required this.bidp5,
    required this.bidp_rsqn1,
    required this.bidp_rsqn2,
    required this.bidp_rsqn3,
    required this.bidp_rsqn4,
    required this.bidp_rsqn5,
  });
  
  factory Output.fromJson(Map<String, dynamic> json)
  => _$OutputFromJson(json);
}
