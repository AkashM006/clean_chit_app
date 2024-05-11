import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class PinSetup2 extends StatelessWidget {
  final bool canPop;
  final void Function(bool didPop) backHandler;
  final String? Function(String? value) validator;
  final void Function() nextHandler;

  const PinSetup2({
    super.key,
    required this.canPop,
    required this.backHandler,
    required this.validator,
    required this.nextHandler,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: backHandler,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Confirm your PIN",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 250),
                hintText: "Confirm PIN",
              ),
              obscureText: true,
              textAlign: TextAlign.center,
              enableSuggestions: false,
              autocorrect: false,
              maxLength: 24,
              validator: validator,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => backHandler(false),
                  child: const Text("Back"),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 2,
                ),
                FilledButton(
                  onPressed: nextHandler,
                  child: const Text("Proceed"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
