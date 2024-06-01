import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/managers/string_manager.dart';

class UnDefinedRouteView extends StatelessWidget {
  const UnDefinedRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringManager.noRouteFound,
        ),
      ),
      body: const Center(
        child: Text(
          StringManager.noRouteFound,
        ),
      ),
    );
  }
}
