import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/presentation/state/auth.state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'router.state.g.dart';

final routerKey = GlobalKey<NavigatorState>();
GoRouter? prevRouter;

@riverpod
GoRouter router(RouterRef ref) {
  final isLoggedIn = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: routerKey,
    redirect: (context, state) {
      if (state.fullPath == null) return null;

      if (state.fullPath == PAGES.auth.path ||
          state.fullPath == PAGES.pinsetup.path) {
        if (isLoggedIn) return PAGES.home.path;

        return null;
      } else if (!isLoggedIn) {
        return PAGES.auth.path;
      }

      return null;
    },
    routes: routes,
  );
}
