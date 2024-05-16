import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showDeviceLoginFailedDialog(context, void Function() authenticate) {
  showDialog(
    context: context,
    builder: (context) => DeviceLoginFailedDialog(authenticate: authenticate),
  );
}

class DeviceLoginFailedDialog extends StatelessWidget {
  final void Function() authenticate;

  const DeviceLoginFailedDialog({
    super.key,
    required this.authenticate,
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
        icon: const Icon(Icons.lock_outline),
        title: const Text(
          "$appName is locked",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "To unlock the full potential of our app and ensure your security, kindly unlock your device. Your journey to a seamless experience awaits! 🔓✨",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              authenticate();
            },
            child: const Text("Login"),
          ),
        ],
        actionsAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
