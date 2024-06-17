import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/create_chit/chit_dates_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/create_chit/chit_detail_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const pageAnimationDuration = Duration(milliseconds: 400);
const pageAnimattionCurve = Curves.easeInOut;

class ChitsCreatePage extends ConsumerStatefulWidget {
  const ChitsCreatePage({
    super.key,
  });

  @override
  ConsumerState<ChitsCreatePage> createState() => _ChitsCreatePageState();
}

class _ChitsCreatePageState extends ConsumerState<ChitsCreatePage> {
  int step = 1;
  bool isLoading = false;

  ChitWithDates currentChitWithDates = ChitWithDates(
    chit: ChitModel.placeholder,
    dates: [],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _pageGoBack() async {
    setState(() {
      step = 1;
    });
  }

  void _pageGoNext() async {
    setState(() {
      step = 2;
    });
  }

  void onDetailsFormFinish() {
    _pageGoNext();
  }

  void _backHandler(bool didPop) {
    if (didPop) return;

    if (step == 1) return;

    setState(() {
      step = 1;
    });

    _pageGoBack();
  }

  void submitHandler(ChitModel newChit) {
    final currentChit = currentChitWithDates.chit;
    var newChitWithDates =
        ChitWithDates(chit: newChit, dates: currentChitWithDates.dates);

    if (newChit.people != currentChit.people ||
        newChit.frequencyNumber != currentChit.frequencyNumber ||
        newChit.frequencyType != currentChit.frequencyType ||
        newChit.startDate != currentChit.startDate) {
      final scheduledDates = getScheduledDates(
        newChit.startDate,
        newChit.frequencyType,
        newChit.frequencyNumber,
        newChit.people,
      );
      newChitWithDates = newChitWithDates.copyWith(dates: scheduledDates);
    }
    setState(() {
      currentChitWithDates = newChitWithDates;
    });
    _pageGoNext();
  }

  void handleChitDateChange(int index, DateTime date) {
    final newDates =
        currentChitWithDates.dates.map((date) => date.copyWith()).toList();
    newDates[index] = date;
    setState(() {
      currentChitWithDates = currentChitWithDates.copyWith(dates: newDates);
    });
  }

  void chitCreateHandler() {
    ref.read(chitControllerProvider.notifier).createChit(currentChitWithDates);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      chitControllerProvider,
      (previous, next) {
        if (next.createChit.isLoading) {
          setState(() {
            isLoading = true;
          });
          return;
        }

        setState(() {
          isLoading = false;
        });

        final message = next.createChit.isFailure
            ? "Something went wrong when trying to create a chit. Please try again later!"
            : "Successfully created your chit!";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            _pageGoBack();
            Navigator.pop(context);
          },
        );
      },
    );

    return PopScope(
      canPop: step == 1,
      onPopInvoked: _backHandler,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Create Chit'),
        body: AnimatedContainer(
          duration: pageAnimationDuration,
          child: AnimatedCrossFade(
            firstChild: ChitDetailForm(
              onSubmitHandler: submitHandler,
            ),
            secondChild: ChitDatesForm(
              dates: currentChitWithDates.dates.map((date) => date).toList(),
              onDateChanged: handleChitDateChange,
              onSubmit: chitCreateHandler,
              onBack: _pageGoBack,
              isLoading: isLoading,
            ),
            crossFadeState: step == 1
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: pageAnimationDuration,
          ),
        ),
      ),
    );
  }
}
