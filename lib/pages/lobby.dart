import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_tester/network/sender.dart';

class LobbyScreen extends StatelessWidget {
  LobbyScreen({super.key}) {
    foo();
  }

  void foo() async {
    EasyLoading.show();
    await Sender().createToken();
    await Sender().getUserInfo();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('Lobby.');
  }
}
