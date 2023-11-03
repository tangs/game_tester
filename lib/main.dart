import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_tester/pages/launch.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade400),
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[400],
        useMaterial3: true,
      ),
      home: SafeArea(child: LaunchScreen()),
      builder: EasyLoading.init(),
    );
  }
}
