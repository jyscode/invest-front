import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_invest/common/layout/default_layout.dart';
import 'package:korea_invest/user/model/update_user_body.dart';
import 'package:korea_invest/user/model/user_model.dart';
import 'package:korea_invest/user/provider/user_provider.dart';

import '../../common/dio/dio.dart';
import '../repository/user_repository.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  TextEditingController apiKeyController = TextEditingController();
  TextEditingController apiSecretController = TextEditingController();
  TextEditingController apiAccountController = TextEditingController();
  TextEditingController apiAccountbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    if(user is UserModel){
      apiKeyController.text = user.apikey;
      apiSecretController.text = user.apisecret;
      apiAccountController.text = user.account.toString();
      apiAccountbController.text = user.accountb.toString();

    }

    return DefaultLayout(
        title: '마이페이지', child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        insertTextForm('apikey', apiKeyController, Icons.key),
        insertTextForm('apisecret', apiSecretController, Icons.security_rounded),
        insertTextForm('계좌번호', apiAccountController, Icons.account_balance_wallet),
        insertTextForm('계좌번호뒤', apiAccountbController, Icons.wallet),

        ElevatedButton(
          onPressed: () => updateUser(
            apiKeyController.text,
            apiSecretController.text,
            int.parse(apiAccountController.text),
            int.parse(apiAccountbController.text),
          ),
          child: Text('수정하기'),
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).logout();
            },
            child: Text('로그아웃')),
      ],
    ),
    );
  }

  updateUser(String apikey, String apisecret, int account, int accountb) async {
    final repository = ref.read(userRepositoryProvider);
    final user = ref.read(userProvider.notifier).state;

    if (user is UserModel) {
      print(user.id);
      await repository.updateUser(
          id: user.id,
          body: UpdateUserBody(
            apikey: apikey,
            apisecret: apisecret,
            account: account,
            accountb: accountb,
          ));
      ref.read(userProvider.notifier).getMe();
    }
  }

  Widget insertTextForm(String text, TextEditingController controller, IconData icon){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: Row(
        children: [
          Expanded(child: Text(text), flex: 1,),
          Expanded(
            flex: 4,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                border: OutlineInputBorder(),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
