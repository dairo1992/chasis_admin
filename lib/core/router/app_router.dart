import 'package:chasis_admin/core/router/app_route.dart';
import 'package:chasis_admin/core/router/route_observer/app_route_observer.dart';
import 'package:chasis_admin/core/services/services_locator_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter? _router;

  static GoRouter _buildRouter() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final serviceLocator = ServiceLocatorImpl.instance;
    const initialLocation = Routes.authentication;

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
