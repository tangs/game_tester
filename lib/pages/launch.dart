import 'package:flutter/material.dart';
import 'package:game_tester/main.dart';
import 'package:game_tester/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatelessWidget {
  LaunchScreen({super.key}) {
    init();
  }

  Future<(String, String)> loadLoginData() async {
    var sp = await SharedPreferences.getInstance();
    var name = sp.getString('account') ?? '';
    var password = sp.getString('password') ?? '';
    return (name, password);
  }

  void init() async {
    var ret = await Future.wait<(String, String)>([
      Future.delayed(
        const Duration(seconds: 1),
        loadLoginData,
      )
    ]);
    var (account, password) = ret[0];

    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => LoginScreen(account: account, password: password),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.apple),
    );
  }
}
