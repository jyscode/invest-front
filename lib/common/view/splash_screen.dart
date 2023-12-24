import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/common/view/root_tab.dart';
import 'package:korea_invest/database/stock_database.dart';
import 'package:korea_invest/hive/model/code_model.dart';
import 'package:korea_invest/user/view/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final Box<CodeModel> box = Hive.box<CodeModel>('code');

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  void deleteToken() async {
    final storage = ref.read(secureStorageProvider);
    await storage.deleteAll();
  }

  void checkToken() async {
    final storage = ref.read(secureStorageProvider);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    // "2023-06-14 13:50:43"
    final expireDate = await storage.read(key: EXPIRE_DATE);
    final DateTime now = DateTime.now();

    print('Check Token');

    // if (accessToken == null || expireDate == null || DateTime.parse(expireDate).compareTo(now) < 0) {
    //   Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (_) => LoginScreen()),
    //     (route) => false,
    //   );
    // }
    if (box.isEmpty) {
      addDatabase();
    }
  }

  void addDatabase() async {
    final data = await readFile();
    final box = Hive.box<CodeModel>('code');
    for (var v in data!) {
      box.add(CodeModel(code: v[0].toString(), name: v[2]));
    }
    print(box.length);

  }

  Future<List<List>> readFile() async {
    String kosdaq = await rootBundle.loadString('asset/kosdaq_code.csv');
    String kospi = await rootBundle.loadString('asset/kospi_code.csv');
    List<List<dynamic>> rowsAsListOfValuesKosdaq =
    const CsvToListConverter().convert(kosdaq);
    List<List<dynamic>> rowAsListOfValuesKospi =
    const CsvToListConverter().convert(kospi);

    final rowsAsListOfValues = [
      ...rowsAsListOfValuesKosdaq,
      ...rowAsListOfValuesKospi
    ];

    return rowsAsListOfValues;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
