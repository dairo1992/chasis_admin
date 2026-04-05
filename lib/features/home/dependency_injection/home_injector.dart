import 'package:flutter_commons/dependency_injection/dependency_injector.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:flutter_commons/enviromnents/values/environment_values.dart';
import 'package:flutter_commons/router/app_route.dart';
import 'package:flutter_commons/router/routes.dart';

import '../presentation/pages/home_page.dart';

class HomeInjector implements DependencyInjector {
  final ServiceLocator serviceLocator;

  HomeInjector({required this.serviceLocator});

  @override
  void registerDependencies(EnvironmentValues environmentValues) {
    // Home Route
    serviceLocator.registerLazySingleton<AppRoute>(
      () => AppRoute(
        route: Routes.home,
        page: const HomePage(),
      ),
      instanceName: Routes.home.name,
    );
  }
}
