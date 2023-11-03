import 'package:flutter/material.dart';

class HUD extends StatelessWidget {
  const HUD({
    super.key,
    required this.nickname,
    required this.money,
  });

  final String nickname;
  final double money;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Text('nickname: $nickname'),
        ],
      ),
    );
  }
}
