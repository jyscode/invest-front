import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:korea_invest/common/const/data.dart';
import 'package:korea_invest/common/dio/dio.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/user/model/post_sign_body.dart';
import 'package:korea_invest/user/provider/user_provider.dart';
import 'package:korea_invest/user/repository/user_repository.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '회원가입',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextFormField(
            controller: nicknameController,
            decoration: InputDecoration(
              label: Text('NICKNAME'),
              prefixIcon: Icon(Icons.perm_identity),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: idController,
            decoration: InputDecoration(
              label: Text('EMAIL'),
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              label: Text('PASSWORD'),
              prefixIcon: Icon(Icons.fingerprint),
              border: OutlineInputBorder(),
            ),
          ),

          ElevatedButton(
            onPressed: () => signUp(nicknameController.text, idController.text, passwordController.text),
            child: Text('가입하기'),
          ),
        ],
      ),
    );
  }

  signUp(String nick, String id, String pw) async {
    final dio = ref.read(dioProvider);
    final repository = ref.read(userRepositoryProvider);
    final storage = FlutterSecureStorage();
    final user = ref.read(userProvider.notifier);

    final token = await repository.signUp(body: PostSignBody(nickname: nick, email: id, password: pw));
    await storage.write(key: LOGIN_ACCESS_KEY, value: token.accessToken);
    await storage.write(key: LOGIN_REFRESH_KEY, value: token.refreshToken);
    final userResp = await repository.getMe();

    user.state = userResp;
    ChangeNotifier();

  }
}
