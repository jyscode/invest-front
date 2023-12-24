import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:korea_invest/common/view/root_tab.dart';
import 'package:korea_invest/common/view/splash_screen.dart';
import 'package:korea_invest/hive/model/code_model.dart';
import 'package:korea_invest/korea/view/stock_price_view.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:korea_invest/user/provider/user_provider.dart';
import 'package:korea_invest/user/view/login_screen.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase?>(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
    GoRoute(
      path: '/',
      name: RootTab.routeName,
      builder: (_, __) => RootTab(),
      routes: [
        GoRoute(path: 'stock',
        name: StockPriceView.routeName,
        builder: (_, state) {
          CodeModel model = state.extra as CodeModel;
          return StockPriceView(model: model);
        })
      ]
    ),
    GoRoute(
      path: '/splash',
      name: SplashScreen.routeName,
      builder: (_, __) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.routeName,
      builder: (_, __) => LoginScreen(),
    ),
  ];

  // Splash Screen Token 존재하는지 확인 후 로그인 스크린, 홈 스크린 어디로 보내줄지 확인


  FutureOr<String?> redirectLogic(BuildContext context, GoRouterState state) {
    final UserModelBase? user = ref.read(userProvider);
    final loggingIn = state.matchedLocation == '/login';

    // 유저 정보가 없는데 로그인 중이면 그대로 두고
    // 로그인 중이 아니면 로그인 페이지로 이동
    if (user == null) {
      return loggingIn ? null : '/login';
    }

    // 사용자 정보가 있는 경우
    // 로그인 중이거나 현재위치가 splash screen 이면 홈으로 이동
    if (user is UserModel) {
      return loggingIn || state.matchedLocation == '/splash' ? '/' : null;
    }

    if (user is UserModelError) {
      return !loggingIn ? '/login' : null;
    }

    return null;
  }

  logout() async {

    ref.read(userProvider.notifier).logout();
    notifyListeners();
  }

  getMe() {
    final user = ref.read(userProvider.notifier).state;

    return user;
  }
}
