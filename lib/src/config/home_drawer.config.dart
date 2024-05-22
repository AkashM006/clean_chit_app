import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:flutter/material.dart';

class Route {
  final String path;
  final String name;
  final String appBarTitle;
  final Widget? leading;

  const Route({
    required this.name,
    required this.path,
    required this.appBarTitle,
    this.leading,
  });
}

final homeRoute = Route(
  name: PAGES.home.name,
  appBarTitle: "Home",
  leading: const Icon(Icons.home_filled),
  path: PAGES.home.path,
);
final chitRoute = Route(
  name: PAGES.chits.name,
  appBarTitle: "Chits",
  leading: const Icon(Icons.create_new_folder_rounded),
  path: PAGES.chits.path,
);
final chitPaymentRoute = Route(
  name: PAGES.chitpayments.name,
  appBarTitle: 'Chit Payments',
  leading: const Icon(Icons.payment),
  path: PAGES.chitpayments.path,
);

final Map<String, List<Route>> routesMappedIntoSections = {
  "": [homeRoute],
  "Master": [chitRoute],
  "Payments": [chitPaymentRoute]
};

final List<Route> routes = [
  homeRoute,
  chitRoute,
  chitPaymentRoute,
];
