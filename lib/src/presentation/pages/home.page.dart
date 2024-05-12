import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final GoRouterState routerState;
  const HomePage({
    super.key,
    required this.routerState,
  });

  @override
  Widget build(BuildContext context) {
    void handleNavigation() {
      context.push(PAGES.chits.path);
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: handleNavigation,
          child: const Text("Go to chits"),
        ),
      ),
    );
  }
}
