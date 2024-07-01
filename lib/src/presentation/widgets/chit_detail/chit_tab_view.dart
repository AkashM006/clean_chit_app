import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_date_item.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/chit_payment_item.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/responsive.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChitTabView extends StatelessWidget {
  final List<DateTime> dates;
  final List<ChitPaymentModel> chitPayments;
  final int chitId;
  const ChitTabView({
    super.key,
    required this.dates,
    required this.chitPayments,
    required this.chitId,
  });

  @override
  Widget build(BuildContext context) {
    void onPaymentClicked(int chitPaymentId) {
      context.push(PAGES.chitpaymentdetail.path, extra: chitPaymentId);
    }

    void onCreatePaymentClicked() {
      Map<String, dynamic> queryParameters = {
        "chitId": chitId.toString(),
      };
      context.pushNamed(
        PAGES.chitpaymentcreate.name,
        queryParameters: queryParameters,
      );
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
            Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 5,
              ),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Center(
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
