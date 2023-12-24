// 성공 실패 여부(0 성공, 나머지 실패), msg_cd 응답 코드

import 'package:json_annotation/json_annotation.dart';

part 'order_res_model.g.dart';

@JsonSerializable()
class OrderResModel {
  final String rt_cd;
  final String msg_cd;
  final String msg1;
  final OrderOutput? output;

  OrderResModel({
    required this.rt_cd,
    required this.msg_cd,
    required this.msg1,
    this.output,
  });

  factory OrderResModel.fromJson(Map<String, dynamic> json)
  => _$OrderResModelFromJson(json);
}

// 주문 번호, 주문 시각
@JsonSerializable()
class OrderOutput {
  final String ODNO;
  final String ORD_TMD;

  OrderOutput({
    required this.ODNO,
    required this.ORD_TMD,
  });

  factory OrderOutput.fromJson(Map<String, dynamic> json)
  => _$OrderOutputFromJson(json);
}
