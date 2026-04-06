import 'package:go_router/go_router.dart';
import 'package:chasis_admin/core/router/base_route.dart';
import 'package:chasis_admin/core/router/redirection_handlers/redirection_handler.dart';
import 'package:app_core/utils/extensions/iterable_extension.dart';

extension RedirectionHandlerExtension on RedirectionHandler {
  String? get redirectionRoute {
    return data?.redirectionRoute;
  }

  bool isAllowedRoute(GoRouterState state) {
    final route = state.name ?? state.path;
    return isInAllowList(route) && !isInDenyList(route);
  }

  bool isInAllowList(String? route) {
    return _existInList(route, data?.allowList, defaultResult: true);
  }

  bool isInDenyList(String? route) {
    return _existInList(route, data?.allowList, defaultResult: true);
  }

  bool _existInList(
    String? route,
    List<BaseRoute>? list, {
    required bool defaultResult,
  }) {
    if (list == null) return defaultResult;
    final matchdRoute = list.firstWhereOrNull(
      (item) => item.name == route || item.path == route,
    );
    return matchdRoute != null;
  }
}
