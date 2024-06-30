import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/detail_item.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/responsive.widget.dart';
import 'package:flutter/material.dart';

class ChitPaymentDetailBody extends StatelessWidget {
  final ChitPaymentWithChitNameAndIdModel chitPaymentWithChitAndIdModel;
  const ChitPaymentDetailBody({
    super.key,
    required this.chitPaymentWithChitAndIdModel,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final chitPayment = chitPaymentWithChitAndIdModel.chitPayment;

    final newLayout = Container(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3),
      constraints: BoxConstraints(maxWidth: Responsive.mobileBreakPoint),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  chitPaymentWithChitAndIdModel.chit.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1,
                ),
                Text(
                  getFormattedDate(chitPayment.paymentDate),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
              ],
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: Responsive.isPortarit(context) ? 3 : 5,
            crossAxisSpacing: SizeConfig.safeBlockHorizontal * 2,
            mainAxisSpacing: SizeConfig.safeBlockVertical * 2,
            children: [
              DetailItem(
                title: "Paid Amount",
                description: displayFormattedCurrency(chitPayment.paidAmount),
              ),
              DetailItem(
                title: "Received Amount",
                description:
                    displayFormattedCurrency(chitPayment.receivedAmount),
              ),
              DetailItem(
                title: "Payment Type",
                description: capitalize(chitPayment.paymentType.name),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
          ),
        ],
      ),
    );

    return Responsive(
      mobile: newLayout,
      tablet: Center(
        child: newLayout,
      ),
    );
  }
}
