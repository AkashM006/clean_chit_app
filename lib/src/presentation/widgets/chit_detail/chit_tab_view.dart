import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_date_item.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/chit_payment_item.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
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
    void onPaymentClicked(int chitPaymentId) {
      // todo: redirect the user to chit payment screen
    }

    void onCreatePaymentClicked() {
      // todo: redirect to the create payment, change that page such that we are able to select the chit from here
    }

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

    final paymentWidgets = chitPayments
        .map(
          (chitPayment) => ChitPaymentItem(
            chitPayment: chitPayment,
            title: capitalize(chitPayment.paymentType.name),
            onTap: () => onPaymentClicked(chitPayment.id),
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
          if (paymentWidgets.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have not made any payments for this chit yet",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  TextButton(
                    onPressed: onCreatePaymentClicked,
                    child: const Text("Create a Payment for this chit"),
                  )
                ],
              ),
            ),
          if (paymentWidgets.isNotEmpty)
            SingleChildScrollView(
              child: Column(
                children: paymentWidgets,
              ),
            ),
        ],
      ),
    );
  }
}
