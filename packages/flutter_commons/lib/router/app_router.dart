import 'package:flutter/material.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:flutter_commons/router/app_route.dart';
import 'package:flutter_commons/router/route_observer/app_route_observer.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter? _router;

  static GoRouter _buildRouter() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final serviceLocator = ServiceLocator.instance;
    final initialLocation = Routes.authentication;

    final List<AppRoute> routes = [];

    final Iterable<AppRoute> featuresRoutes = [
      Routes.authentication,
      Routes.home,
    ].map((route) => serviceLocator.get<AppRoute>(instanceName: route.name));

    routes.addAll(featuresRoutes.toList());

    return GoRouter(
      initialLocation: initialLocation.path,
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: routes.map((route) => route.build()).toList(),
      observers: [serviceLocator.get<AppRouteObserver>()],
    );
  }

  static GoRouter builRouter() {
    _router ??= _buildRouter();
    return _router!;
  }
}
