import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/router.dart';

Widget getTestWidgetFromInitialLocation({
  required String initialLocation,
  List<Override> overrides = const [],
}) {
  final router = getRouter(null, initialLocation);

  return ProviderScope(
    overrides: overrides,
    child: MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    ),
  );
}

Widget getTestWidgetFromInitialWidget({
  required Widget initialWidget,
  List<Override> overrides = const [],
}) {
  final router = getRouter(Scaffold(body: initialWidget));

  return ProviderScope(
    overrides: overrides,
    child: MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    ),
  );
}
