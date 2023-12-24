import 'package:flutter/material.dart';
import 'package:korea_invest/common/const/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool? obscure;

  const CustomTextForm({
    this.hintText,
    this.errorText,
    this.obscure,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: PRIMARY_COLOR,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,
      ),
    );
  }
}
