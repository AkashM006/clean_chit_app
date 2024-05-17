import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/forms/chit_date_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/forms/chit_detail_form.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const animationDuration = Duration(milliseconds: 250);

void showChitBottomSheet(context, ChitWithDates? chit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return ChitBottomSheet(
        chitWithDates: chit,
      );
    },
  );
}

class ChitBottomSheet extends ConsumerStatefulWidget {
  final ChitWithDates? chitWithDates;
  const ChitBottomSheet({
    super.key,
    this.chitWithDates,
  });

  @override
  ConsumerState<ChitBottomSheet> createState() => _ChitBottomSheetState();
}

class _ChitBottomSheetState extends ConsumerState<ChitBottomSheet> {
  bool isLoading = false;
  int currentChitStep = 1;
  late ChitModel newChit;
  List<DateTime> _dates = [];

  @override
  void initState() {
    newChit = widget.chitWithDates?.chit ?? ChitModel.placeholder;
    _dates = widget.chitWithDates?.dates ?? [];
    super.initState();
  }

  void onChitDetailSave(ChitModel chit) {
    final hasUserEditedChitDates = chit.startDate != newChit.startDate ||
        chit.frequencyType != newChit.frequencyType ||
        chit.frequencyNumber != newChit.frequencyNumber ||
        chit.people != newChit.people;

    newChit = chit;

    final result = hasUserEditedChitDates
        ? getScheduledDates(
            chit.startDate,
            chit.frequencyType,
            chit.frequencyNumber,
            chit.people,
          )
        : _dates;
    setState(() {
      currentChitStep = 2;
      if (hasUserEditedChitDates) _dates = result;
    });
  }

  void onDateChanged(int index, DateTime newDate) {
    setState(() {
      _dates[index] = newDate;
    });
  }

  void handleFormSubmit() {
    newChit = newChit.copyWith(dates: _dates);
    if (widget.chitWithDates == null) {
      ref.read(chitControllerProvider.notifier).createChit(newChit);
    } else {
      ref.read(chitControllerProvider.notifier).editChit(newChit);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chitControllerProvider, (previous, next) {
      if (next.createChit.isLoading) {
        setState(() {
          isLoading = true;
        });
        return;
      }
      isLoading = false;
      if (next.createChit.isFailure) {
        setState(() {
          currentChitStep = 1;
        });
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Something went wrong when trying to create a chit. Please try again later!",
            ),
          ),
        );
      } else if (next.createChit.isSuccess) {
        setState(() {
          currentChitStep = 1;
        });
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Successfully created your chit!",
            ),
          ),
        );
      }
    });

    return PopScope(
      canPop: currentChitStep == 1,
      onPopInvoked: (didPop) {
        if (!didPop) {
          setState(() {
            currentChitStep = 1;
          });
        }
      },
      child: AnimatedContainer(
        duration: animationDuration,
        child: AnimatedCrossFade(
          firstChild: ChitDetailForm(
            chit: widget.chitWithDates?.chit,
            onChitDetailSave: onChitDetailSave,
          ),
          secondChild: ChitDateForm(
            dates: _dates,
            isLoading: isLoading,
            onDateChanged: onDateChanged,
            onBackhandler: () => setState(() {
              currentChitStep = 1;
            }),
            onSubmitHandler: handleFormSubmit,
            isCreating: widget.chitWithDates == null,
          ),
          crossFadeState: currentChitStep == 1
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: animationDuration,
        ),
      ),
    );
  }
}
