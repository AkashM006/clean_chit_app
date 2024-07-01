import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChitItem extends ConsumerWidget {
  final ChitWithDates chitWithDates;

  const ChitItem({
    super.key,
    required this.chitWithDates,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onViewMore() {
      context.push(PAGES.chitdetail.path, extra: chitWithDates.chit.id);
    }

    return ListTile(
      onTap: onViewMore,
      title: Text(chitWithDates.chit.name),
      subtitle:
          Text('Amount: ${getFormattedCurrency(chitWithDates.chit.amount)}'),
      trailing: const Icon(Icons.arrow_right),
    );
  }
}
