import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:game_tester/pages/lobby.dart';
import 'package:game_tester/network/sender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final String account;
  final String password;
  const LoginScreen({super.key, required this.account, required this.password});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 10000);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');

    var ret = await Sender().login(account: data.name, password: data.password);
    if (ret?.success != true) return ret?.msg ?? 'unkonwn err.';
    var sp = await SharedPreferences.getInstance();
    sp.setString('account', data.name);
    sp.setString('password', data.password);
    return null;
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
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
      savedEmail: widget.account,
      savedPassword: widget.password,
      onLogin: _authUser,
      // onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LobbyScreen(),
          ),
        );
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
