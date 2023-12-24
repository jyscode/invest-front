import 'package:json_annotation/json_annotation.dart';

part 'update_order_body.g.dart';

@JsonSerializable()
class UpdateOrderBody {
  final int orderid;

  UpdateOrderBody({
    required this.orderid,
  });

  factory UpdateOrderBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateOrderBodyToJson(this);
}
