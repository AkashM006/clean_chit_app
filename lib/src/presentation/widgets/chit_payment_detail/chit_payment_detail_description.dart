import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/detail_item.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class ChitPaymentDetailDescription extends StatelessWidget {
  final ChitPaymentModel chitPayment;
  const ChitPaymentDetailDescription({
    super.key,
    required this.chitPayment,
  });

  @override
  Widget build(BuildContext context) {
    final chitPaymentAsMap = chitPayment.asMap();
    chitPaymentAsMap.remove("Payment Date");

    final chitPaymentEntries = chitPaymentAsMap.entries;
    int half = (chitPaymentEntries.length / 2).round();

    final leftWidgets = chitPaymentEntries
        .take(half)
        .map((entry) => DetailItem(title: entry.key, description: entry.value))
        .toList();

    final rightWidgets = chitPaymentEntries
        .skip(half)
        .map((entry) => DetailItem(title: entry.key, description: entry.value))
        .toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: leftWidgets,
          ),
        ),
        SizedBox(
          width: SizeConfig.safeBlockHorizontal * 2,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rightWidgets,
          ),
        )
      ],
    );
  }
}
