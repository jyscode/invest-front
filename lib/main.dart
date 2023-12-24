import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/provider/go_router.dart';
import 'package:korea_invest/hive/model/code_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:korea_invest/user/view/login_screen.dart';
import 'package:stack_trace/stack_trace.dart';

import 'common/view/root_tab.dart';



void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CodeModelAdapter());
  await Hive.openBox<CodeModel>('code');

  FlutterError.demangleStackTrace = (StackTrace stack) {
    // Trace and Chain are classes in package:stack_trace
    if (stack is Trace) {
      return stack.vmTrace;
    }
    if (stack is Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
