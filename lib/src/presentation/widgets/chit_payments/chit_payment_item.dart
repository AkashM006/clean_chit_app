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

    final List<Widget> amountWidgets = [];

    if (receivedAmount.isNotEmpty) {
      amountWidgets.add(
        Text(
          "+ $receivedAmount",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: greenColor),
        ),
      );
    }

    if (paidAmount.isNotEmpty) {
      amountWidgets.add(
        Text(
          "- $paidAmount",
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: redColor),
        ),
      );
    }

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(chitPayment.chit.name),
          amountWidgets[0],
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(getFormattedDate(chitPayment.paymentDate)),
          if (amountWidgets.length == 2) amountWidgets[1],
        ],
      ),
    );
  }
}
