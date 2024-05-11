import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class PinLoginPage extends StatefulWidget {
  final String pin;
  final void Function() loginHandler;
  const PinLoginPage({
    super.key,
    required this.pin,
    required this.loginHandler,
  });

  @override
  State<PinLoginPage> createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String pin = '';

  String? _validatePin(value) {
    if (value == null || value != widget.pin) return "Please enter a valid pin";
    return null;
  }

  void _loginHandler() {
    if (!_formKey.currentState!.validate()) return;
    widget.loginHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Login to $appName",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Your PIN",
                      constraints: BoxConstraints(maxWidth: 250),
                    ),
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    textAlign: TextAlign.center,
                    validator: _validatePin,
                    onSaved: (newValue) => pin = newValue!,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                FilledButton(
                  onPressed: _loginHandler,
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
