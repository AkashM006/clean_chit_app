import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payments/chit_payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPaymentsList extends ConsumerWidget {
  final List<ChitPaymentWithChitNameAndIdModel> chitPayments;

  const ChitPaymentsList({
    super.key,
    required this.chitPayments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (chitPayments.isEmpty) {
      return Center(
        child: Text(
          "You have made no chit payments",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontStyle: FontStyle.italic),
        ),
      );
    }

    return ListView.separated(
      itemCount: chitPayments.length,
      itemBuilder: (context, index) => ChitPaymentsItem(
        chitPaymentWithChit: chitPayments[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
