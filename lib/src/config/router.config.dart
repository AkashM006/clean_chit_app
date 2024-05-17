import 'package:chit_app_clean/src/app.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/setup/pin_setup.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chits.page.dart';
import 'package:chit_app_clean/src/presentation/pages/home.page.dart';
import 'package:chit_app_clean/src/utils/widgets/auth_checker.middleware.dart';
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
        return 'Auth';
      case PAGES.home:
        return 'Home';
      case PAGES.pinsetup:
        return "Setup Pin";
      case PAGES.chits:
        return 'Chits';
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.auth:
        return (context, routerState) => AuthCheckerMiddleware(
              path: path,
              canPop: false,
              shouldBeLoggedIn: false,
              child: App(
                routerState: routerState,
              ),
            );
      case PAGES.home:
        return (context, routerState) => BackgroundListenerWrapper(
              name: "Home",
              child: AuthCheckerMiddleware(
                path: path,
                shouldBeLoggedIn: true,
                child: const HomePage(),
              ),
            );
      case PAGES.pinsetup:
        return (context, routerState) => AuthCheckerMiddleware(
              path: path,
              shouldBeLoggedIn: false,
              child: PinSetupPage(routerState: routerState),
            );
      case PAGES.chits:
        return (context, routerState) => AuthCheckerMiddleware(
              path: path,
              shouldBeLoggedIn: true,
              child: const ChitPage(),
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

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: routes,
);
