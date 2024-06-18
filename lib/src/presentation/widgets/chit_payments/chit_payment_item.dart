import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';

class ChitPaymentsItem extends StatelessWidget {
  final ChitPaymentWithChitNameAndIdModel chitPayment;
  const ChitPaymentsItem({
    super.key,
    required this.chitPayment,
  });

  @override
  Widget build(BuildContext context) {
    void onViewMore() {
      // todo: Handle view more
    }

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
              .bodyMedium!
              .copyWith(color: greenColor),
        ),
      );
    }

    if (paidAmount.isNotEmpty) {
      amountWidgets.add(
        Text(
          "- $paidAmount",
          style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: redColor),
        ),
      );
    }

    return ListTile(
      title: Text(chitPayment.chit.name),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              getFormattedDate(chitPayment.paymentDate),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: [
              amountWidgets[0],
              if (amountWidgets.length == 2)
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 3,
                ),
              if (amountWidgets.length == 2) amountWidgets[1],
            ],
          ),
        ],
      ),
      onTap: onViewMore,
      trailing: const Icon(Icons.arrow_right),
    );
  }
}
