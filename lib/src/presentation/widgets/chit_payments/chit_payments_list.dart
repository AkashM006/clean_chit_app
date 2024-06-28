import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/chit_payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChitPaymentsList extends ConsumerWidget {
  final List<ChitPaymentWithChitNameAndIdModel> chitPayments;

  const ChitPaymentsList({
    super.key,
    required this.chitPayments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTap(int chitPaymentId) {
      context.push(PAGES.chitPaymentDetail.path, extra: chitPaymentId);
    }

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
      itemBuilder: (context, index) => ChitPaymentItem(
        chitPayment: chitPayments[index].chitPayment,
        title: chitPayments[index].chit.name,
        onTap: () => onTap(chitPayments[index].chitPayment.id),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
