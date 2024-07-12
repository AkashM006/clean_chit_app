import 'package:chit_app_clean/src/config/theme.config.dart';
import 'package:chit_app_clean/src/domain/models/chit_payment.model.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/material.dart';

class ChitPaymentItem extends StatelessWidget {
  final ChitPaymentModel chitPayment;
  final String title;
  final void Function()? onTap;
  const ChitPaymentItem({
    super.key,
    required this.chitPayment,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final greenColor = getSuccessColor(context);

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
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getFormattedDate(chitPayment.paymentDate),
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
      onTap: onTap,
      trailing: onTap == null ? null : const Icon(Icons.arrow_right),
    );
  }
}
