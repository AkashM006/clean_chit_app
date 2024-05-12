import 'package:chit_app_clean/src/app.dart';
import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/setup/pin_setup.page.dart';
import 'package:chit_app_clean/src/presentation/pages/home.page.dart';
import 'package:chit_app_clean/src/presentation/state/auth.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'router.state.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final isLoggedIn = ref.watch(authStateProvider);

  final router = GoRouter(
    redirect: (context, state) {
      if (state.fullPath == null) return null;

      if (state.fullPath == PAGES.auth.path) {
        if (!isLoggedIn) return null;
        // if user is logged in and tries to reach the auth page then must be taken to home page
        return PAGES.home.path;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: PAGES.auth.path,
        name: PAGES.auth.name,
        builder: (context, state) => const App(),
      ),
      GoRoute(
        path: PAGES.pinsetup.path,
        name: PAGES.pinsetup.name,
        builder: (context, state) => const PinSetupPage(),
      ),
      GoRoute(
        path: PAGES.home.path,
        name: PAGES.home.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  ref.onDispose(() {
    router.dispose();
  });

  return router;
}
