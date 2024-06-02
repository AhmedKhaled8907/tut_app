// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:tut_app/presentation/resources/managers/images_manager.dart';
// import 'package:tut_app/presentation/resources/managers/color_manager.dart';
// import 'package:tut_app/presentation/resources/managers/router_manager.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   SplashViewState createState() => SplashViewState();
// }

// class SplashViewState extends State<SplashView> {
//   Timer? _timer;

//   _startDelay() {
//     _timer = Timer(const Duration(seconds: 2), _goNext());
//   }

//   _goNext() {
//     // Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
//     Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _startDelay();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.primary,
//       body: Center(
//         child: Image.asset(
//           ImagesManager.splashLogo,
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/managers/constants_manager.dart';
import 'package:tut_app/presentation/resources/managers/images_manager.dart';
import 'package:tut_app/presentation/resources/managers/color_manager.dart';
import 'package:tut_app/presentation/resources/managers/router_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(
      const Duration(seconds: ConstantsManager.splashDelay),
      _goNext,
    );
  }

  Future<void> _goNext() async {
    await Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
