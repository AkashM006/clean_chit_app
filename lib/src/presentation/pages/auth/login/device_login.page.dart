import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceLoginPage extends ConsumerStatefulWidget {
  const DeviceLoginPage({super.key});

  @override
  ConsumerState<DeviceLoginPage> createState() => _DeviceLoginPageState();
}

class _DeviceLoginPageState extends ConsumerState<DeviceLoginPage> {
  void checkUserAuth() {}

  @override
  void initState() {
    super.initState();

    checkUserAuth();
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
