import 'package:hive/hive.dart';

part 'code_model.g.dart';

@HiveType(typeId: 1)
class CodeModel {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String name;

  CodeModel({
    required this.code,
    required this.name,
  });
}
