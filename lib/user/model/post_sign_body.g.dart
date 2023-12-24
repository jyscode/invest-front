// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_sign_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSignBody _$PostSignBodyFromJson(Map<String, dynamic> json) => PostSignBody(
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PostSignBodyToJson(PostSignBody instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'email': instance.email,
      'password': instance.password,
    };
