import 'package:flutter/material.dart';

class RequiredInputLabel extends StatelessWidget {
  final String label;
  const RequiredInputLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: label, style: Theme.of(context).textTheme.bodyLarge),
          TextSpan(
            text: " *",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.error),
          )
        ],
      ),
    );
  }
}
