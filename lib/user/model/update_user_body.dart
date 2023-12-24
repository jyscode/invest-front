
import 'package:json_annotation/json_annotation.dart';

part 'update_user_body.g.dart';

@JsonSerializable()
class UpdateUserBody {
  final String apikey;
  final String apisecret;
  final int account;
  final int accountb;

  UpdateUserBody({
    required this.apikey,
    required this.apisecret,
    required this.account,
    required this.accountb,
  });

  factory UpdateUserBody.fromJson(Map<String, dynamic> json)
  => _$UpdateUserBodyFromJson(json);

  Map<String, dynamic> toJson() =>_$UpdateUserBodyToJson(this);
}
