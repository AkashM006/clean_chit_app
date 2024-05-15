import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:chit_app_clean/src/presentation/state/auth.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackgroundListenerWrapper extends ConsumerStatefulWidget {
  final Widget child;
  final String name;

  const BackgroundListenerWrapper({
    super.key,
    required this.child,
    required this.name,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BackgroundListenerWrapperState();
}

class _BackgroundListenerWrapperState
    extends ConsumerState<BackgroundListenerWrapper>
    with WidgetsBindingObserver {
  DateTime lastSeen = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        lastSeen = DateTime.now();
        break;
      case AppLifecycleState.resumed:
        final now = DateTime.now();
        if (now.difference(lastSeen) > appInactivityDuration) {
          ref.read(authStateProvider.notifier).logout();
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
