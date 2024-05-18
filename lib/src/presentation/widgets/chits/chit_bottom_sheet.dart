import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/forms/chit_date_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/forms/chit_detail_form.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const animationDuration = Duration(milliseconds: 250);

void showChitBottomSheet(context, ChitModel? chit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return ChitBottomSheet(
        chit: chit,
      );
    },
  );
}

class ChitBottomSheet extends ConsumerStatefulWidget {
  final ChitModel? chit;
  const ChitBottomSheet({
    super.key,
    this.chit,
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
    _dates = widget.chit?.dates != null ? [...widget.chit!.dates] : [];
    newChit = widget.chit ?? ChitModel.placeholder;
    super.initState();
  }

  void onChitDetailSave(ChitModel chit) {
    // to check if the user has changed the chit details that affect the date
    final hasUserEditedChitDates =
        !compareDates(newChit.startDate, chit.startDate) ||
            chit.frequencyType != newChit.frequencyType ||
            chit.frequencyNumber != newChit.frequencyNumber ||
            chit.people != newChit.people;

    if (widget.chit != null && !hasUserEditedChitDates) {
      newChit = chit.copyWith(
        dates: newChit.dates,
        createdAt: newChit.createdAt,
        endDate: newChit.endDate,
        startDate: newChit.startDate,
      );

      setState(() {
        currentChitStep = 2;
        _dates = [...widget.chit!.dates];
      });
      return;
    }

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
    if (widget.chit == null) {
      newChit = newChit.copyWith(dates: _dates);
      ref.read(chitControllerProvider.notifier).createChit(newChit);
    } else {
      newChit = newChit.copyWith(
        id: widget.chit!.id,
        dates: _dates,
      );

      // to check if the user has changed any of the chit details, if not no need to call db
      final isEqual = ChitModel.equals(newChit, widget.chit!);

      if (isEqual) {
        setState(() {
          currentChitStep = 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context).pop();
          });
        });
        return;
      }
      ref.read(chitControllerProvider.notifier).editChit(newChit);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chitControllerProvider, (previous, next) {
      if (next.createChit.isLoading || next.editChit.isLoading) {
        setState(() {
          isLoading = true;
        });
        return;
      }
      isLoading = false;
      setState(() {
        currentChitStep = 1;
      });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.of(context).pop();
      });
      String message = "";
      if (widget.chit != null) {
        message = next.editChit.isFailure
            ? "Something went wrong when trying to edit your chit. Please try again later!"
            : "Successfully edited you chit!";
      } else {
        message = next.createChit.isFailure
            ? "Something went wrong when trying to create a chit. Please try again later!"
            : "Successfully created your chit!";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
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
            chit: widget.chit,
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
            isCreating: widget.chit == null,
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
