import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:flutter/material.dart';

final appLightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: appSeedColor,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);

final appDarkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: appSeedColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

Color? getSuccessColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Colors.green[200]
      : Colors.green[800];
}
