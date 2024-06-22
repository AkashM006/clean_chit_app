import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:flutter/material.dart';

class ChitTabView extends StatelessWidget {
  final List<DateTime> dates;
  final List<ChitPaymentModel> chitPayments;
  const ChitTabView({
    super.key,
    required this.dates,
    required this.chitPayments,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Text("Dates"),
        Text("Payments"),
      ],
    );
  }
}
