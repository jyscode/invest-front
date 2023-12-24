import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

abstract class UserModelBase {}

class UserModelLoading extends UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({
    required this.message,
  });
}

@JsonSerializable()
class UserModel extends UserModelBase {
  final int id;
  final String nickname;
  final String email;
  final int account;
  final int accountb;
  final int orderid;
  final String apikey;
  final String apisecret;

  UserModel({
    required this.id,
    required this.nickname,
    required this.email,
    required this.account,
    required this.accountb,
    required this.orderid,
    required this.apikey,
    required this.apisecret,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
