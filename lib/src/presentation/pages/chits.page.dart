import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChitPage extends StatelessWidget {
  final GoRouterState routerState;
  const ChitPage({
    super.key,
    required this.routerState,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Chits"),
      ),
    );
  }
}
