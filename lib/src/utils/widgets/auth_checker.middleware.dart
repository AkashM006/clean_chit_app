import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/presentation/state/auth.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthCheckerMiddleware extends ConsumerStatefulWidget {
  final bool shouldBeLoggedIn;
  final Widget child;
  final bool isActive;

  const AuthCheckerMiddleware({
    super.key,
    required this.shouldBeLoggedIn,
    required this.isActive,
    required this.child,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthCheckerMiddlewareState();
}

class _AuthCheckerMiddlewareState extends ConsumerState<AuthCheckerMiddleware> {
  bool shouldExit = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (!widget.isActive) return;

      if (!next) {
        if (widget.shouldBeLoggedIn) {
          print("Pushed auth ${widget.child}");
          context.push(PAGES.auth.path);
        }
        return;
      }

      if (!widget.shouldBeLoggedIn) {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(PAGES.home.path);
        }
      }
    });

    final isLoggedIn = ref.watch(authStateProvider);

    return PopScope(
      canPop: shouldExit,
      onPopInvoked: (didPop) {
        if (didPop) return;

        if (!widget.shouldBeLoggedIn && !isLoggedIn) {
          print("Here trigger");
          setState(() {
            shouldExit = true;
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            SystemNavigator.pop();
          });
        }
      },
      child: widget.child,
    );
  }
}
