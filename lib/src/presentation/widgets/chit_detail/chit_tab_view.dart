import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_date_item.dart';
import 'package:chit_app_clean/src/utils/widgets/responsive.widget.dart';
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
    final dateWidgets = dates
        .asMap()
        .entries
        .map(
          (entry) => ChitDateItem(
            date: entry.value,
            chitNo: entry.key,
          ),
        )
        .toList();

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Responsive.mobileBreakPoint),
      child: TabBarView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: dateWidgets,
            ),
          ),
          const Text("Payments"),
        ],
      ),
    );
  }
}
