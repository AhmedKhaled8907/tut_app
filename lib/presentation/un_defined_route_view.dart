import 'package:flutter/material.dart';

class UnDefinedRouteView extends StatelessWidget {
  const UnDefinedRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "No Route Found",
        ),
      ),
      body: const Center(
        child: Text(
          "No Route Found",
        ),
      ),
    );
  }
}