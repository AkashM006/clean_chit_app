import 'package:chit_app_clean/src/presentation/widgets/auth/pin_setup/pin_setup_1.dart';
import 'package:chit_app_clean/src/presentation/widgets/auth/pin_setup/pin_setup_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const pageAnimationDuration = Duration(milliseconds: 400);
const pageAnimattionCurve = Curves.easeInOut;

class PinSetupPage extends ConsumerStatefulWidget {
  final GoRouterState routerState;
  const PinSetupPage({
    super.key,
    required this.routerState,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => PinSetupPageState();
}

class PinSetupPageState extends ConsumerState<PinSetupPage> {
  late PageController _pageController;
  final _formKey = GlobalKey<FormState>();

  String pin = "";
  int step = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _pinNexthandler() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    _pageController.nextPage(
      duration: pageAnimationDuration,
      curve: pageAnimattionCurve,
    );
    setState(() {
      step = 2;
    });
  }

  void _pinSaveHandler(String? value) {
    pin = value!;
  }

  void _backHandler(bool didPop) {
    if (didPop) return;
    setState(() {
      step = 1;
    });
    _pageController.previousPage(
      duration: pageAnimationDuration,
      curve: pageAnimattionCurve,
    );
  }

  String? _confirmPinValidator(String? value) {
    if (value == null || value != pin) return "Pin does not match";
    return null;
  }

  void _confirmPinNextHandler() {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      step = 1;
    });
    context.pop(pin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: PageView(
          controller: _pageController,
          children: [
            PinSetup1(
              nextHandler: _pinNexthandler,
              saveHandler: _pinSaveHandler,
            ),
            PinSetup2(
              canPop: step == 1,
              backHandler: _backHandler,
              validator: _confirmPinValidator,
              nextHandler: _confirmPinNextHandler,
            ),
          ],
        ),
      ),
    );
  }
}
