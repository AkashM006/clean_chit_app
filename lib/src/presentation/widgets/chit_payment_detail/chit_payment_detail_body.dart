import 'package:chit_app_clean/src/domain/models/chit_payment.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payment_detail/chit_payment_detail_description.dart';
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

    final layout = SingleChildScrollView(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Container(
        constraints: BoxConstraints(maxWidth: Responsive.mobileBreakPoint),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
            ChitPaymentDetailDescription(
              chitPayment: chitPayment,
            )
          ],
        ),
      ),
    );

    return Responsive(
      mobile: layout,
      tablet: Center(
        child: layout,
      ),
    );
  }
}
