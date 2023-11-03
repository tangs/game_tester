import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_tester/main.dart';
import 'package:game_tester/network/sender.dart';
import 'package:game_tester/pages/lobby/hud.dart';
import 'package:game_tester/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LobbyScreen extends StatelessWidget {
  final List<String> entries = <String>[
    'game-318',
    'game-319',
    'game-256',
    'game-318',
    'game-319',
    'game-256',
    'game-318',
    'game-319',
    'game-256',
    'game-318',
    'game-319',
    'game-256',
    'game-256',
    'game-256',
    'game-999',
  ];
  LobbyScreen({super.key}) {
    // foo();
  }

  void foo() async {
    EasyLoading.show();
    await Sender().createToken();
    await Sender().getUserInfo();
    EasyLoading.dismiss();
  }

  ListView buildGames(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () => EasyLoading.showToast('on tap ${entries[index]}'),
            child: Container(
              width: 240,
              color: Color.fromARGB(
                255,
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
              ),
              child: Center(child: Text(entries[index])),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void backToLoginPage() async {
    var sp = await SharedPreferences.getInstance();
    var account = sp.getString('account') ?? '';
    var password = sp.getString('password') ?? '';
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(
          account: account,
          password: password,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Tester'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: backToLoginPage,
        ),
        elevation: 4,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // const Row(
              //     children: [Expanded(child: Center(child: Text('Top')))]),
              const HUD(nickname: 'nickname', money: 123456),
              const Spacer(),
              Expanded(child: buildGames(context)),
              const Spacer(),
              const Row(
                  children: [Expanded(child: Center(child: Text('Bottom')))]),
            ],
          ),
        ),
      ),
    );
  }
}
