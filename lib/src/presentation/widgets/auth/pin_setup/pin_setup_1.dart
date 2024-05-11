import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/validators.dart';
import 'package:flutter/material.dart';

class PinSetup1 extends StatelessWidget {
  final void Function() nextHandler;
  final void Function(String? value) saveHandler;

  const PinSetup1({
    super.key,
    required this.nextHandler,
    required this.saveHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Setup your PIN",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 250),
                hintText: "PIN",
              ),
              obscureText: true,
              textAlign: TextAlign.center,
              enableSuggestions: false,
              autocorrect: false,
              maxLength: 24,
              validator: (value) {
                return minLengthValidator(value, 'PIN', 8);
              },
              onSaved: saveHandler,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            FilledButton(
              onPressed: nextHandler,
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
