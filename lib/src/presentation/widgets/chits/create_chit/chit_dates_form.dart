import 'package:chit_app_clean/src/presentation/widgets/chits/forms/chit_date.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class ChitDatesForm extends StatelessWidget {
  final List<DateTime> dates;
  final bool isLoading;
  final void Function(int index, DateTime date) onDateChanged;
  final void Function() onSubmit;
  final void Function() onBack;

  const ChitDatesForm({
    super.key,
    required this.dates,
    required this.onDateChanged,
    required this.onSubmit,
    required this.onBack,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 3,
          right: SizeConfig.safeBlockHorizontal * 3,
          top: SizeConfig.safeBlockVertical * 3,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemBuilder: (context, index) => ChitDate(
                initialDate: dates[index],
                label: 'Chit ${index + 1} Date:',
                onDateChanged: (date) => onDateChanged(index, date),
              ),
              itemCount: dates.length,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  FilledButton(
                    onPressed: onSubmit,
                    child: const Text("Create"),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 3,
                  ),
                  TextButton(
                    onPressed: onBack,
                    child: const Text("Back"),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
