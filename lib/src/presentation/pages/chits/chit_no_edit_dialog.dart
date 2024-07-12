import 'package:flutter/material.dart';

class ChitNoEditDialog extends StatelessWidget {
  const ChitNoEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void handleOk() {
      Navigator.of(context).pop();
    }

    return AlertDialog(
      title: const Text("No Changes Done"),
      content: const Text("Please make any changes to save"),
      actions: [
        TextButton(onPressed: handleOk, child: const Text("Ok")),
      ],
    );
  }
}
