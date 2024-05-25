import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';

class ChitPaymentsItem extends StatelessWidget {
  final ChitPaymentsModel chitPayment;
  const ChitPaymentsItem({
    super.key,
    required this.chitPayment,
  });

  @override
  Widget build(BuildContext context) {
    final greenColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.green[200]
        : Colors.green[800];

    final redColor = Theme.of(context).colorScheme.error;

    final paidAmount = chitPayment.paidAmount == 0
        ? ''
        : getFormattedCurrency(chitPayment.paidAmount);

    final receivedAmount = chitPayment.receivedAmount == 0
        ? ''
        : getFormattedCurrency(chitPayment.receivedAmount);

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(chitPayment.chit.name),
          if (paidAmount.isNotEmpty)
            Text(
              "- $paidAmount",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: redColor),
            ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(getFormattedDate(chitPayment.paymentDate)),
          if (receivedAmount.isNotEmpty)
            Text(
              "+ $receivedAmount",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: greenColor),
            )
        ],
      ),
    );
  }
}
