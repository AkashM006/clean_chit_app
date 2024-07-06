import 'package:chit_app_clean/src/domain/models/user_settings.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/user_settings/user_settings.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void handleUpdateAction(
  BuildContext context,
  WidgetRef ref,
  LoginType selectedLoginType,
) {
  final updateUserSettingsController =
      ref.read(userSettingsControllerProvider).updateUserSettings;
  if (updateUserSettingsController.isFailure &&
      selectedLoginType == LoginType.deviceLock) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          updateUserSettingsController.message,
        ),
      ),
    );
  }
}
