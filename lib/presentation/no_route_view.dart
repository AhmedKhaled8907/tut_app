import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/managers/string_manager.dart';

class NoRouteView extends StatelessWidget {
  const NoRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.noRouteFound,
        ),
      ),
      body: const Center(
        child: Text(
          AppStrings.noRouteFound,
        ),
      ),
    );
  }
}
