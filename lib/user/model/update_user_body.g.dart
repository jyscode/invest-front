// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserBody _$UpdateUserBodyFromJson(Map<String, dynamic> json) =>
    UpdateUserBody(
      apikey: json['apikey'] as String,
      apisecret: json['apisecret'] as String,
      account: json['account'] as int,
      accountb: json['accountb'] as int,
    );

Map<String, dynamic> _$UpdateUserBodyToJson(UpdateUserBody instance) =>
    <String, dynamic>{
      'apikey': instance.apikey,
      'apisecret': instance.apisecret,
      'account': instance.account,
      'accountb': instance.accountb,
    };
