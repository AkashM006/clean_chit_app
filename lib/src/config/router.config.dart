import 'package:chit_app_clean/src/app.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/pages/auth/setup/pin_setup.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chit_payments/chit_payment_detail.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chit_payments/chit_payments.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chit_payments/chit_payment_create.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chits/chit_detail.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chits/chits.page.dart';
import 'package:chit_app_clean/src/presentation/pages/chits/chits_create.page.dart';
import 'package:chit_app_clean/src/presentation/pages/home.page.dart';
import 'package:chit_app_clean/src/utils/functions/transformers.dart';
import 'package:chit_app_clean/src/utils/widgets/auth_checker.middleware.dart';
import 'package:chit_app_clean/src/utils/widgets/background_listener.wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

enum PAGES {
  auth,
  home,
  pinsetup,
  chits,
  chitcreate,
  chitpayments,
  chitpaymentcreate,
  chitdetail,
  chitpaymentdetail,
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
      case PAGES.chitcreate:
        return '/chits-create';
      case PAGES.chitpayments:
        return '/chit-payments';
      case PAGES.chitpaymentcreate:
        return '/chit-payments-create';
      case PAGES.chitdetail:
        return '/chit-detail';
      case PAGES.chitpaymentdetail:
        return '/chit-payment-detail';
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
      case PAGES.chitcreate:
        return 'Create Chit';
      case PAGES.chitpayments:
        return 'Chit Payment';
      case PAGES.chitpaymentcreate:
        return 'Create Chit Payment';
      case PAGES.chitdetail:
        return 'Chit Detail';
      case PAGES.chitpaymentdetail:
        return 'Chit Payment Detail';
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
      case PAGES.chitcreate:
        return (context, routerState) {
          final chitWithDates = routerState.extra as ChitWithDates?;
          final isEditing = transformToBool(
            routerState.uri.queryParameters['isEdit'],
          );
          return AuthCheckerMiddleware(
            path: path,
            shouldBeLoggedIn: true,
            child: ChitsCreatePage(
              chitWithDates: chitWithDates,
              isEdit: isEditing ?? false,
            ),
          );
        };
      case PAGES.chitpayments:
        return (context, routerState) => AuthCheckerMiddleware(
              path: path,
              shouldBeLoggedIn: true,
              child: const ChitPaymentsPage(),
            );
      case PAGES.chitpaymentcreate:
        return (context, routerState) {
          // NOTE: The values below are keep in case the user wants to create a chit and somethings want to be filled
          final paymentTypeIndex =
              routerState.uri.queryParameters['paymentType']; // pass the index
          final paymentType = paymentTypeIndex != null
              ? PaymentType.values[int.parse(paymentTypeIndex)]
              : null;
          final chitId =
              transformToInt(routerState.uri.queryParameters['chitId']);
          final paidAmount =
              transformToInt(routerState.uri.queryParameters['paidAmount']);
          final receivedAmount =
              transformToInt(routerState.uri.queryParameters['receivedAmount']);
          final isEdit =
              transformToBool(routerState.uri.queryParameters['isEdit']);

          final isEditingMode = isEdit != null && isEdit;

          final paymentDate =
              isEditingMode ? null : routerState.extra as DateTime?;

          // NOTE: This is used only when the user is editing a chit
          final chitPaymentWithChitNameAndIdModel = isEditingMode
              ? routerState.extra as ChitPaymentWithChitNameAndIdModel
              : null;

          return AuthCheckerMiddleware(
            shouldBeLoggedIn: true,
            path: path,
            child: ChitPaymentCreatePage(
              chitId: chitId,
              paidAmount: paidAmount,
              paymentDate: paymentDate,
              paymentType: paymentType,
              receivedAmount: receivedAmount,
              isEdit: isEdit,
              chitPaymentWithChitNameAndIdModel:
                  chitPaymentWithChitNameAndIdModel,
            ),
          );
        };
      case PAGES.chitdetail:
        return (context, routerState) => AuthCheckerMiddleware(
              shouldBeLoggedIn: true,
              path: path,
              child: ChitDetailPage(
                chitId: routerState.extra as int,
              ),
            );
      case PAGES.chitpaymentdetail:
        return (context, routerState) => AuthCheckerMiddleware(
              shouldBeLoggedIn: true,
              path: path,
              child: ChitPaymentDetailPage(
                chitPaymentId: routerState.extra as int,
              ),
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
