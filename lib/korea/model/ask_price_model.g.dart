// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskPriceModel _$AskPriceModelFromJson(Map<String, dynamic> json) =>
    AskPriceModel(
      output1: Output.fromJson(json['output1'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskPriceModelToJson(AskPriceModel instance) =>
    <String, dynamic>{
      'output1': instance.output1,
    };

Output _$OutputFromJson(Map<String, dynamic> json) => Output(
      askp1: json['askp1'] as String,
      askp2: json['askp2'] as String,
      askp3: json['askp3'] as String,
      askp4: json['askp4'] as String,
      askp5: json['askp5'] as String,
      askp_rsqn1: json['askp_rsqn1'] as String,
      askp_rsqn2: json['askp_rsqn2'] as String,
      askp_rsqn3: json['askp_rsqn3'] as String,
      askp_rsqn4: json['askp_rsqn4'] as String,
      askp_rsqn5: json['askp_rsqn5'] as String,
      bidp1: json['bidp1'] as String,
      bidp2: json['bidp2'] as String,
      bidp3: json['bidp3'] as String,
      bidp4: json['bidp4'] as String,
      bidp5: json['bidp5'] as String,
      bidp_rsqn1: json['bidp_rsqn1'] as String,
      bidp_rsqn2: json['bidp_rsqn2'] as String,
      bidp_rsqn3: json['bidp_rsqn3'] as String,
      bidp_rsqn4: json['bidp_rsqn4'] as String,
      bidp_rsqn5: json['bidp_rsqn5'] as String,
    );

Map<String, dynamic> _$OutputToJson(Output instance) => <String, dynamic>{
      'askp1': instance.askp1,
      'askp2': instance.askp2,
      'askp3': instance.askp3,
      'askp4': instance.askp4,
      'askp5': instance.askp5,
      'bidp1': instance.bidp1,
      'bidp2': instance.bidp2,
      'bidp3': instance.bidp3,
      'bidp4': instance.bidp4,
      'bidp5': instance.bidp5,
      'askp_rsqn1': instance.askp_rsqn1,
      'askp_rsqn2': instance.askp_rsqn2,
      'askp_rsqn3': instance.askp_rsqn3,
      'askp_rsqn4': instance.askp_rsqn4,
      'askp_rsqn5': instance.askp_rsqn5,
      'bidp_rsqn1': instance.bidp_rsqn1,
      'bidp_rsqn2': instance.bidp_rsqn2,
      'bidp_rsqn3': instance.bidp_rsqn3,
      'bidp_rsqn4': instance.bidp_rsqn4,
      'bidp_rsqn5': instance.bidp_rsqn5,
    };
