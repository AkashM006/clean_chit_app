import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_description.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/responsive.widget.dart';
import 'package:flutter/material.dart';

class ChitDetailBody extends StatelessWidget {
  final ChitModel chit;
  const ChitDetailBody({
    super.key,
    required this.chit,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final layout = Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 4,
          ),
          constraints: BoxConstraints(maxWidth: Responsive.mobileBreakPoint),
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                chit.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              Row(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  const Icon(Icons.currency_rupee),
                  Text(
                    getFormattedCurrency(chit.amount),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * (isMobile ? 5 : 10),
              ),
              ChitDescription(chit: chit),
              SizedBox(
                height: SizeConfig.safeBlockVertical * (isMobile ? 5 : 10),
              ),
            ],
          ),
        ),
      ],
    );

    return Responsive(
      mobile: layout,
      tablet: Center(
        child: layout,
      ),
    );
  }
}
