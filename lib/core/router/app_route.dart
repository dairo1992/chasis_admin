import 'dart:async';

import 'package:app_core/data/errors/app_exception.dart';
import 'package:app_core/utils/extensions/string_extension.dart';
import 'package:chasis_admin/core/router/base_route.dart';
import 'package:chasis_admin/core/router/custom_transition.dart';
import 'package:chasis_admin/core/router/redirection_handlers/implementations/redirection_handler_type.dart';
import 'package:chasis_admin/core/router/redirection_handlers/redirection_handler.dart';
import 'package:chasis_admin/core/router/redirection_handlers/redirection_handler_data.dart';
import 'package:chasis_admin/core/router/redirection_handlers/redirection_handler_factory.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  final BaseRoute route;
  final bool useNamedRoute;
  final List<AppRoute> subRoutes;
  final List<RedirectionHandler> redirectionHandlers;
  final Widget? page;
  final Widget Function(GoRouterState state)? customBuilder;
  final String? defaultRedirectionRouteByDataValidation;
  final RedirectionHandlerFactory? redirectionHandlerFactory;

  AppRoute({
    required this.route,
    this.useNamedRoute = true,
    this.subRoutes = const [],
    this.redirectionHandlers = const [],
    this.page,
    this.customBuilder,
    this.defaultRedirectionRouteByDataValidation,
    this.redirectionHandlerFactory,
  });

  GoRoute build() {
    return useNamedRoute
        ? GoRoute(
            path: route.path,
            name: route.name,
            pageBuilder: buildPage,
            redirect: onRedirect,
            routes: _buildSubRoutes(),
          )
        : GoRoute(
            path: route.path,
            pageBuilder: buildPage,
            redirect: onRedirect,
            routes: _buildSubRoutes(),
          );
  }

  @visibleForTesting
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    final widget = customBuilder?.call(state) ?? page;
    if (widget != null) {
      return CustomTransition.animation(widget, state);
    }
    throw const ServerException(
        message:
            'Both page and custom builder can not be null on route definition');
  }

  @visibleForTesting
  FutureOr<String?> onRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final allRedirectionHandlers = _getAllRedirectionHandlers();
    for (final handler in allRedirectionHandlers) {
      final result = await handler.onRedirect(context, state);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  List<RouteBase> _buildSubRoutes() {
    return subRoutes.map((e) => e.build()).toList();
  }

  List<RedirectionHandler> _getAllRedirectionHandlers() {
    List<RedirectionHandler> handlers = [];
    handlers.addAll(redirectionHandlers);
    if (defaultRedirectionRouteByDataValidation.isNullOrEmpty) return handlers;
    final additionalData = RedirectionHandlerData(
      redirectionRoute: defaultRedirectionRouteByDataValidation,
    );

    final handler = redirectionHandlerFactory
        ?.get(type: RedirectionHandlerType.routeDataValidation)
        .setAdditionalData(additionalData);
    if (handler == null) return handlers;
    handlers.add(handler);
    return handlers;
  }
}
