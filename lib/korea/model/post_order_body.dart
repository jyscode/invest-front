
import 'package:json_annotation/json_annotation.dart';

part 'post_order_body.g.dart';

// 계좌번호 앞, 계좌번호 뒤, 종목 코드, 구매 방식(00 지정가, 01 시장가), 수량, 금액
@JsonSerializable()
class PostOrderBody {

  final String CANO;
  final String ACNT_PRDT_CD;
  final String PDNO;
  final String ORD_DVSN;
  final String ORD_QTY;
  final String ORD_UNPR;

  PostOrderBody({
    required this.CANO,
    required this.ACNT_PRDT_CD,
    required this.PDNO,
    required this.ORD_DVSN,
    required this.ORD_QTY,
    required this.ORD_UNPR
  });
  
  factory PostOrderBody.fromJson(Map<String, dynamic> json)
  => _$PostOrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PostOrderBodyToJson(this);
}