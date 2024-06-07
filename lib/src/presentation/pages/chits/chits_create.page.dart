import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/create_chit/chit_dates_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/create_chit/chit_detail_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
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
  late PageController _pageController;
  int step = 1;
  bool isLoading = false;

  ChitModel currentChit = ChitModel.placeholder;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _pageGoBack() async {
    // await _pageController.previousPage(
    //   duration: pageAnimationDuration,
    //   curve: pageAnimattionCurve,
    // );
    setState(() {
      step = 1;
    });
  }

  void _pageGoNext() async {
    // await _pageController.nextPage(
    //   duration: pageAnimationDuration,
    //   curve: pageAnimattionCurve,
    // );
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
    setState(() {
      currentChit = newChit;
    });
    _pageGoNext();
  }

  void handleChitDateChange(int index, DateTime date) {
    final newDates = currentChit.dates;
    newDates[index] = date;
    setState(() {
      currentChit = currentChit.copyWith(dates: newDates);
    });
  }

  void chitCreateHandler() {
    // todo: Call controller method and  handle loading state
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: step == 1,
      onPopInvoked: _backHandler,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Create Chit'),
        // todo: start from here, check the console error
        // body: PageView(
        //   controller: _pageController,
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: [
        // ChitDetailForm(
        //   onSubmitHandler: submitHandler,
        // ),
        // ChitDatesForm(
        //   dates: currentChit.dates,
        //   onDateChanged: handleChitDateChange,
        //   onSubmit: chitCreateHandler,
        //   onBack: _pageGoBack,
        //   isLoading: isLoading,
        // ),
        //   ],
        // ),
        body: AnimatedContainer(
          duration: pageAnimationDuration,
          child: AnimatedCrossFade(
            firstChild: ChitDetailForm(
              onSubmitHandler: submitHandler,
            ),
            secondChild: ChitDatesForm(
              dates: currentChit.dates,
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
