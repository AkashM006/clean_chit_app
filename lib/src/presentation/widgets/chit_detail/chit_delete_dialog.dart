import 'package:flutter/material.dart';

class ChitDeleteDialog extends StatelessWidget {
  const ChitDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void onConfirm() {
      Navigator.of(context).pop(true);
    }

    void onCancel() {
      Navigator.of(context).pop(false);
    }

    return AlertDialog(
      title: const Text("Do you want to delete?"),
      content: const Text(
          "Are you sure you want to delete this chit and all its payments?"),
      actions: [
        TextButton(
          onPressed: onConfirm,
          child: const Text("Ok"),
        ),
        TextButton(
          onPressed: onCancel,
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
