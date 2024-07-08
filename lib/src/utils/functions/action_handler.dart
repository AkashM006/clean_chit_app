import 'package:chit_app_clean/src/utils/classes/controller_state.dart';
import 'package:flutter/material.dart';

void actionHandler(
  ControllerState controllerState,
  BuildContext context, {
  void Function()? successCallback,
  void Function()? failureCallback,
  void Function()? finalCallback,
}) {
  final message = controllerState.message;

  print("Status: ${controllerState.status}");

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );

  if (successCallback != null && controllerState.isSuccess) {
    successCallback();
  } else if (failureCallback != null && controllerState.isFailure) {
    failureCallback();
  }

  if (finalCallback != null) finalCallback();
}
