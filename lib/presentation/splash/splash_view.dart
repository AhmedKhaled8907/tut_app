import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/managers/images_manager.dart';
import 'package:tut_app/presentation/resources/managers/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(
          ImagesManager.splashLogo,
        ),
      ),
    );
  }
}
