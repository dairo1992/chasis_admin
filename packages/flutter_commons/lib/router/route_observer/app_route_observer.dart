import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteObserver extends RouteObserver {
  AppRouteObserver();

  final _controllerStream = StreamController<String>.broadcast();
  Stream<String> get subscription => _controllerStream.stream;

  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    await _trySendEvent(route: route);
  }

  @override
  void didPop(Route route, Route? previousRoute) async {
    super.didPop(route, previousRoute);
    final returnsFromPage = (route.settings is CustomTransitionPage);
    if (!returnsFromPage && _isKnowModalRoute(route)) return;
    await _trySendEvent(route: previousRoute);
  }

  Future<void> _trySendEvent({Route? route}) async {
    final name = route?.settings.name;
    if (name == null) return;

    await Future.delayed(Duration.zero);
    _controllerStream.add(name);
  }

  bool _isKnowModalRoute(Route? route) {
    return (route is DialogRoute) && route.settings.name != null;
  }
}
