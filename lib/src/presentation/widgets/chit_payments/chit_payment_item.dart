import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:flutter/material.dart';

class ChitPaymentsItem extends StatelessWidget {
  final ChitPaymentsModel chitPayment;
  const ChitPaymentsItem({
    super.key,
    required this.chitPayment,
  });

  @override
  Widget build(BuildContext context) {
    // todo: Add item dates, paid amount, received amount and others
    return ListTile(
      title: Text(chitPayment.chit.name),
    );
  }
}
