import 'package:chit_app_clean/src/presentation/widgets/chits/forms/chit_date.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitDateForm extends ConsumerWidget {
  final List<DateTime> dates;
  final void Function(int index, DateTime newDate) onDateChanged;
  final void Function() onBackhandler;
  final void Function() onSubmitHandler;
  final bool isLoading;
  final bool isCreating;

  const ChitDateForm({
    super.key,
    required this.dates,
    required this.onDateChanged,
    required this.isLoading,
    required this.onBackhandler,
    required this.onSubmitHandler,
    required this.isCreating,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 3,
          right: SizeConfig.safeBlockHorizontal * 3,
          top: SizeConfig.safeBlockVertical * 3,
          bottom: MediaQuery.of(context).viewInsets.bottom +
              SizeConfig.safeBlockVertical * 3,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Verify Dates",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
            ),
            SliverList.builder(
              itemCount: dates.length,
              itemBuilder: (context, index) => ChitDate(
                key: ValueKey('$index-${dates[index].toString()}'),
                initialDate: dates[index],
                label: 'Chit ${index + 1}',
                onDateChanged: (newDate) => onDateChanged(index, newDate),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  TextButton(
                    onPressed: isLoading ? null : onBackhandler,
                    child: const Text("Back"),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  FilledButton(
                    onPressed: isLoading ? null : onSubmitHandler,
                    child: Text(isCreating ? "Create Chit" : "Edit Chit"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
