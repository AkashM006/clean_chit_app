import 'package:flutter/material.dart';

class RadioListTileButton<T> extends StatelessWidget {
  const RadioListTileButton({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.value,
    required this.title,
    required this.subtitle,
  });

  final T value;
  final T? groupValue;
  final Function(T?)? onChanged;

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final isActive = groupValue == value;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: isActive
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: RadioListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(10),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.outline)),
      ),
    );
  }
}
