import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/chit_bottom_sheet.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitItem extends ConsumerWidget {
  final ChitModel chit;

  const ChitItem({
    super.key,
    required this.chit,
  });

  void handleEdit(BuildContext context, WidgetRef ref) {
    showChitBottomSheet(context, chit);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(chit.name),
      subtitle: Text('Amount: ${getFormattedCurrency(chit.amount)}'),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () => handleEdit(context, ref),
      ),
    );
  }
}
