import 'package:chit_app_clean/src/data/repositories/user_settings/user_settings_repository_impl.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/login/device_login.page.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/login/pin_login.page.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/setup/auth_setup.page.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class App extends ConsumerWidget {
  final GoRouterState routerState;
  const App({
    super.key,
    required this.routerState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    final userSettings = ref.watch(userSettingsProvider);

    return userSettings.when(
      data: (data) {
        if (!data.hasSetupLogin) {
          return const AuthSetupPage();
        }

        if (data.isCustomPinLock) {
          return PinLoginPage(
            pin: data.userPin,
          );
        }

        if (data.isDeviceLock) {
          return const DeviceLoginPage();
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
          child: CustomLoaderWidget(
            text: "Chit App",
          ),
        ),
      ),
    );
  }
}
