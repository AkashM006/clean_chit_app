import 'package:flutter/material.dart';

class EditAppbarIcon extends StatelessWidget {
  const EditAppbarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.edit,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class DeleteAppBarIcon extends StatelessWidget {
  const DeleteAppBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.delete_forever_outlined,
      color: Theme.of(context).colorScheme.error,
    );
  }
}
