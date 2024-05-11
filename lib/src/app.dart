import 'package:chit_app_clean/src/data/repositories/user_settings_repository_impl.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/login/pin_login.page.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/setup/auth_setup.page.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    void loginHandler() {
      // Navigator.pushReplacement(context, newRoute);
    }

    final userSettings = ref.watch(userSettingsProvider);

    return userSettings.when(
      data: (data) {
        if (!data.hasSetupLogin) {
          return const AuthSetupPage();
        }

        if (data.isCustomPinLock) {
          return PinLoginPage(
            pin: data.userPin,
            loginHandler: loginHandler,
          );
        }

        return const Center(
          child: Text("Login Screen"),
        );
      },
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: CustomErrorWidget(
            error.toString(),
          ),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CustomLoaderWidget(),
        ),
      ),
    );
  }
}
