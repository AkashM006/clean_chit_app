import 'package:chit_app_clean/src/config/theme.config.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/presentation/state/router.state.dart';

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Chit App',
      themeMode: ThemeMode.system,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      routerConfig: router,
    );
  }
}
