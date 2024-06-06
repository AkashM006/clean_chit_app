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

  void _pageGoBack() {
    _pageController.previousPage(
      duration: pageAnimationDuration,
      curve: pageAnimattionCurve,
    );
  }

  void _pageGoNext() {
    _pageController.nextPage(
      duration: pageAnimationDuration,
      curve: pageAnimattionCurve,
    );
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

  @override
  Widget build(BuildContext context) {
    // todo: Start here
    return PopScope(
      canPop: step == 1,
      onPopInvoked: _backHandler,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Create Chit'),
        body: PageView(
          controller: _pageController,
          children: [
            ChitDetailForm(),
            ChitDatesForm(),
          ],
        ),
      ),
    );
  }
}
