import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/pages/chits/chit_no_edit_dialog.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/create_chit/chit_dates_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/create_chit/chit_detail_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/utils/functions/action_handler.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const pageAnimationDuration = Duration(milliseconds: 400);
const pageAnimattionCurve = Curves.easeInOut;

class ChitsCreatePage extends ConsumerStatefulWidget {
  final ChitWithDates? chitWithDates;
  final bool isEdit;
  const ChitsCreatePage({
    super.key,
    this.chitWithDates,
    this.isEdit = false,
  });

  @override
  ConsumerState<ChitsCreatePage> createState() => _ChitsCreatePageState();
}

class _ChitsCreatePageState extends ConsumerState<ChitsCreatePage> {
  int step = 1;
  bool hasEdited = false;

  late ChitWithDates currentChitWithDates;

  void initialize() {
    currentChitWithDates = widget.chitWithDates ??
        ChitWithDates(
          chit: ChitModel.placeholder,
          dates: [],
        );
  }

  @override
  void initState() {
    super.initState();
    initialize();
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
    ChitWithDates newChitWithDates = ChitWithDates(
      chit: newChit.copyWith(id: currentChit.id, endDate: currentChit.endDate),
      dates: currentChitWithDates.dates,
    );
    final newChitWithChanges = newChitWithDates.chit;

    if (newChitWithChanges.people != currentChit.people ||
        newChitWithChanges.frequencyNumber != currentChit.frequencyNumber ||
        newChitWithChanges.frequencyType != currentChit.frequencyType ||
        newChitWithChanges.startDate != currentChit.startDate) {
      final scheduledDates = getScheduledDates(
        newChitWithChanges.startDate,
        newChitWithChanges.frequencyType,
        newChitWithChanges.frequencyNumber,
        newChitWithChanges.people,
      );
      newChitWithDates = newChitWithDates.copyWith(dates: scheduledDates);
    }

    if (!newChitWithChanges.equals(currentChitWithDates.chit) &&
        widget.isEdit) {
      hasEdited = true;
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
      if (widget.isEdit) {
        hasEdited = true;
      }
    });
  }

  void chitSubmitHandler() async {
    currentChitWithDates = currentChitWithDates.copyWith(
      chit: currentChitWithDates.chit.copyWith(
        endDate: currentChitWithDates.dates.last,
      ),
    );

    if (widget.isEdit) {
      if (!hasEdited) {
        showDialog(
          context: context,
          builder: (context) => const ChitNoEditDialog(),
        );
        return;
      }
      ref.read(chitControllerProvider.notifier).editChit(currentChitWithDates);
      return;
    }

    await ref
        .read(chitControllerProvider.notifier)
        .createChit(currentChitWithDates);

    final chitControllerState = ref.read(chitControllerProvider).createChit;

    if (mounted) {
      actionHandler(
        chitControllerState,
        context,
        finalCallback: () {
          _pageGoBack();
          context.pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(chitControllerProvider).createChit.isLoading;

    return PopScope(
      canPop: step == 1,
      onPopInvoked: _backHandler,
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.isEdit
              ? "Edit Chit - ${widget.chitWithDates?.chit.name ?? ""}"
              : "Create Chit",
        ),
        body: AnimatedContainer(
          duration: pageAnimationDuration,
          child: AnimatedCrossFade(
            firstChild: ChitDetailForm(
              onSubmitHandler: submitHandler,
              chit: widget.chitWithDates?.chit,
            ),
            secondChild: ChitDatesForm(
              dates: currentChitWithDates.dates.map((date) => date).toList(),
              onDateChanged: handleChitDateChange,
              onSubmit: chitSubmitHandler,
              onBack: _pageGoBack,
              isLoading: isLoading,
              isEdit: widget.isEdit,
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
