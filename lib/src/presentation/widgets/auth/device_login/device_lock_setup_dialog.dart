import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showLockSetupDialog(context, void Function() setPasswordHandler) {
  showDialog(
    context: context,
    builder: (context) => DeviceLockSetupDialog(
      setPasswordHandler: setPasswordHandler,
    ),
  );
}

class DeviceLockSetupDialog extends StatelessWidget {
  final void Function() setPasswordHandler;
  const DeviceLockSetupDialog({
    super.key,
    required this.setPasswordHandler,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        SystemNavigator.pop();
      },
      child: AlertDialog(
        icon: const Icon(Icons.shield_outlined),
        title: const  Text("Secure your device"),
        content: const  Text(
          "To ensure the security of your personal information,"
          " we recommend setting up a screen lock on your device."
          " This additional layer of protection helps safeguard your data within the app.",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: setPasswordHandler,
            child: const Text("Setup Lock"),
          ),
        ],
      ),
    );
  }
}
