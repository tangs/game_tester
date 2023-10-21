import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_tester/network/sender.dart';

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
    foo();
  }

  void foo() async {
    EasyLoading.show();
    await Sender().createToken();
    await Sender().getUserInfo();
    EasyLoading.dismiss();
  }

  ListView buildGames(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                EasyLoading.showToast('on tap ${entries[index]}');
              },
              child: Container(
                width: 240,
                color: Color.fromARGB(255, Random().nextInt(255),
                    Random().nextInt(255), Random().nextInt(255)),
                child: Center(child: Text(entries[index])),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Row(children: [Expanded(child: Center(child: Text('Top')))]),
            const Spacer(),
            Expanded(child: buildGames(context)),
            const Spacer(),
            const Row(
                children: [Expanded(child: Center(child: Text('Bottom')))]),
          ],
        ));
  }
}
