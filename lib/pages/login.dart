import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:game_tester/pages/lobby.dart';
import 'package:game_tester/network/sender.dart';

const users = {
  'a123123': '123123',
};

const serverUrl = 'api.h5navi.com:4433';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 10000);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');

    var ret = await Sender().login(account: data.name, password: data.password);
    if (ret?.success == true) return null;
    return ret?.msg ?? 'unkonwn err.';
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Game Test',
      userType: LoginUserType.name,
      userValidator: (value) {
        if (value?.isEmpty ?? true) {
          return 'user name is empty.';
        }
        return null;
      },
      onLogin: _authUser,
      // onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LobbyScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
