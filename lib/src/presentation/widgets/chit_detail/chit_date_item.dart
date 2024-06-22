import 'package:chit_app_clean/src/config/theme.config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';

class ChitDateItem extends StatelessWidget {
  final DateTime date;
  final int chitNo;
  const ChitDateItem({
    super.key,
    required this.date,
    required this.chitNo,
  });

  @override
  Widget build(BuildContext context) {
    final isChitOver = isDatePastNow(date);
    final subtitleText = isChitOver ? "Completed" : "Upcoming";
    final subtitleColor = isChitOver
        ? getSuccessColor(context)
        : Theme.of(context).colorScheme.error;

    return ListTile(
      title: Text(getFormattedDate(date)),
      subtitle: Row(
        children: [
          Text(
            subtitleText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: subtitleColor),
          ),
        ],
      ),
    );
  }
}
