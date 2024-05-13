import 'package:chit_app_clean/src/app.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/setup/pin_setup.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chits.page.dart';
import 'package:chit_app_clean/src/presentation/pages/home.page.dart';
import 'package:chit_app_clean/src/utils/widgets/background_listener.wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

enum PAGES {
  auth,
  home,
  pinsetup,
  chits,
}

extension AppRoutesExtension on PAGES {
  String get path {
    switch (this) {
      case PAGES.auth:
        return '/';
      case PAGES.home:
        return '/home';
      case PAGES.pinsetup:
        return '/pin-setup';
      case PAGES.chits:
        return '/chits';
    }
  }

  String get name {
    switch (this) {
      case PAGES.auth:
        return 'AUTH';
      case PAGES.home:
        return 'HOME';
      case PAGES.pinsetup:
        return "PIN SETUP";
      case PAGES.chits:
        return 'chits';
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.auth:
        return (context, routerState) => App(routerState: routerState);
      case PAGES.home:
        return (context, routerState) => BackgroundListenerWrapper(
              name: "Home",
              child: HomePage(
                routerState: routerState,
              ),
            );
      case PAGES.pinsetup:
        return (context, routerState) => PinSetupPage(routerState: routerState);
      case PAGES.chits:
        return (context, routerState) => ChitPage(
              routerState: routerState,
            );
    }
  }
}

final List<RouteBase> routes = PAGES.values
    .map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        builder: route.builder,
      ),
    )
    .toList();

// final router = GoRouter(
//   routes: routes,
// );
