
import 'package:json_annotation/json_annotation.dart';

part 'post_sign_body.g.dart';

@JsonSerializable()
class PostSignBody {
  final String nickname;
  final String email;
  final String password;

  PostSignBody({
    required this.nickname,
    required this.email,
    required this.password,
  });

  factory PostSignBody.fromJson(Map<String, dynamic> json)
  => _$PostSignBodyFromJson(json);

  Map<String, dynamic> toJson() =>_$PostSignBodyToJson(this);
}
