import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/domain/models/user_settings.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/user_settings.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/auth/radio_list_tile_button.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/widgets/responsive.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthSetupPage extends ConsumerStatefulWidget {
  const AuthSetupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthSetupPageState();
}

class _AuthSetupPageState extends ConsumerState<AuthSetupPage> {
  LoginType selectedLoginType = LoginType.notSet;

  void onChanged(LoginType? selectedChoice) {
    setState(() {
      selectedLoginType = selectedChoice!;
    });
  }

  void nextHandler() async {
    if (selectedLoginType == LoginType.deviceLock) {
      ref.read(userSettingsControllerProvider.notifier).updateUserSettings(
            const UserSettingsModel(
              loginType: LoginType.notSet,
            ),
          );
      return;
    }

    // final pin = await Navigator.push<String?>(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const PinSetupPage(),
    //   ),
    // );
    final pin = await context.push<String?>(PAGES.pinsetup.path);
    if (pin == null) return;

    ref.read(userSettingsControllerProvider.notifier).updateUserSettings(
          UserSettingsModel(
            loginType: LoginType.customPin,
            userPin: pin,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final isUpdating =
        ref.watch(userSettingsControllerProvider).updateUserSettings.isLoading;

    final titleWidget = Text(
      "Chit App",
      style: Theme.of(context).textTheme.headlineLarge,
    );

    final subtitleWidget = Text(
      "Safeguard your personal information and protect you privacty by selecting your preferrable lock method",
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );

    final deviceLockRadioButtonWidget = RadioListTileButton(
      groupValue: selectedLoginType,
      onChanged: isUpdating ? null : onChanged,
      value: LoginType.deviceLock,
      title: "Device Lock",
      subtitle:
          "Use your device's lock, biometric or face ID to login to the app",
    );

    final customPinRadioButtonWidget = RadioListTileButton(
      groupValue: selectedLoginType,
      onChanged: isUpdating ? null : onChanged,
      value: LoginType.customPin,
      title: "Custom PIN",
      subtitle: "Set a custom PIN through the app and enter the same to login",
    );

    final buttonWidget = FilledButton(
      onPressed: selectedLoginType == LoginType.notSet || isUpdating
          ? null
          : nextHandler,
      child: isUpdating
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(
              selectedLoginType == LoginType.customPin ? "Setup" : "Proceed",
            ),
    );

    // listeners
    ref.listen(userSettingsControllerProvider, (previous, next) {
      if (next.updateUserSettings.isFailure &&
          selectedLoginType == LoginType.deviceLock) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.updateUserSettings.message,
            ),
          ),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  titleWidget,
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.5,
                  ),
                  subtitleWidget,
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.5,
                  ),
                  deviceLockRadioButtonWidget,
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.5,
                  ),
                  customPinRadioButtonWidget,
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: buttonWidget,
                  ),
                ],
              ),
            ),
          ),
          tablet: Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: SizeConfig.safeBlockHorizontal * 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          titleWidget,
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2.5,
                          ),
                          subtitleWidget,
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 5,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          deviceLockRadioButtonWidget,
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2.5,
                          ),
                          customPinRadioButtonWidget,
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2.5,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: buttonWidget,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
