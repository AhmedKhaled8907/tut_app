import 'package:flutter/material.dart';
import 'package:tut_app/presentation/managers/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
    );
  }
}
