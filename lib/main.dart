import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/config/theme.config.dart';
import 'package:chit_app_clean/src/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setup();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chit App',
      themeMode: ThemeMode.system,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      routerConfig: router,
    );
  }
}
