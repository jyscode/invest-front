// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      account: json['account'] as int,
      accountb: json['accountb'] as int,
      orderid: json['orderid'] as int,
      apikey: json['apikey'] as String,
      apisecret: json['apisecret'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'email': instance.email,
      'account': instance.account,
      'accountb': instance.accountb,
      'orderid': instance.orderid,
      'apikey': instance.apikey,
      'apisecret': instance.apisecret,
    };
