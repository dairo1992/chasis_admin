import 'base_route.dart';
import 'package:app_core/utils/constants.dart';

enum Routes implements BaseRoute {
  root(name: Constants.rootScreenRoute),
  authentication(name: Constants.authenticationRouteName),
  home(name: Constants.homeRouteName);

  const Routes({required this.name})
      : path = '${Constants.routePathSeparator}$name';
  @override
  final String name;

  @override
  final String path;

  String add(BaseRoute subRoute) {
    return '$path${Constants.routePathSeparator}${subRoute.name}';
  }
}
