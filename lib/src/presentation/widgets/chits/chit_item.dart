import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChitItem extends ConsumerWidget {
  final ChitModel chit;

  const ChitItem({
    super.key,
    required this.chit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onViewMore() {
      context.push(PAGES.chitDetail.path, extra: chit.id);
    }

    return ListTile(
      onTap: onViewMore,
      title: Text(chit.name),
      subtitle: Text('Amount: ${getFormattedCurrency(chit.amount)}'),
      trailing: const Icon(Icons.arrow_right),
    );
  }
}
