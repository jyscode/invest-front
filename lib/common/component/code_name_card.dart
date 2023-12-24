import 'package:flutter/material.dart';
import 'package:korea_invest/hive/model/code_model.dart';

class CodeNameCard extends StatelessWidget {
  final CodeModel model;

  const CodeNameCard({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.code),
            Text(model.name)
          ],
        ),
      ),
    );
  }
}
