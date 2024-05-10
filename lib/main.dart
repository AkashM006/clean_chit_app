import 'package:chit_app_clean/src/config/theme.config.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/widgets/background_listener.wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chit App',
      themeMode: ThemeMode.system,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      home: const BackgroundListenerWrapper(
        child: Center(
          child: Text("Hello Chit app"),
        ),
      ),
    );
  }
}
