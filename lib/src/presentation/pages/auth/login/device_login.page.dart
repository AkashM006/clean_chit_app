import 'dart:async';

import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:chit_app_clean/src/presentation/state/auth.state.dart';
import 'package:chit_app_clean/src/presentation/widgets/auth/device_login/device_lock_setup_dialog.dart';
import 'package:chit_app_clean/src/presentation/widgets/auth/device_login/device_login_failed_dialog.dart';
import 'package:chit_app_clean/src/utils/functions/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppStatus {
  idle,
  settingLock,
}

class DeviceLoginPage extends ConsumerStatefulWidget {
  const DeviceLoginPage({super.key});

  @override
  ConsumerState<DeviceLoginPage> createState() => _DeviceLoginPageState();
}

class _DeviceLoginPageState extends ConsumerState<DeviceLoginPage>
    with WidgetsBindingObserver {
  AppStatus currentAppStatus = AppStatus.idle;

  late StreamController<bool> _loginStreamController;
  late StreamSubscription<bool> _loginStreamSubscription;

  void checkUserAuth({didUserReturn = false}) async {
    final deviceHasLock = await isDeviceSecured();

    if (!deviceHasLock) {
      if (mounted) showLockSetupDialog(context, setDeviceLockHandler);
      return;
    }

    if (didUserReturn) {
      ref.read(authStateProvider.notifier).login();
      return;
    }

    openDeviceLockPrompt();
  }

  void openDeviceLockPrompt() async {
    final result = await showLock();
    _loginStreamController.add(result);
  }

  void setDeviceLockHandler() async {
    await redirectToDeviceLockSetup();
    currentAppStatus = AppStatus.settingLock;
    if (mounted) Navigator.pop(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (currentAppStatus == AppStatus.settingLock) {
          currentAppStatus = AppStatus.idle;
          checkUserAuth(didUserReturn: true);
          return;
        }
      default:
        return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loginStreamController = StreamController<bool>();
    _loginStreamSubscription = _loginStreamController.stream.listen((event) {
      if (event) {
        ref.read(authStateProvider.notifier).login();
      } else {
        showDeviceLoginFailedDialog(context, openDeviceLockPrompt);
      }
    });
    checkUserAuth();
  }

  @override
  void dispose() {
    super.dispose();
    _loginStreamSubscription.cancel();
    _loginStreamController.close();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Login to $appName",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
