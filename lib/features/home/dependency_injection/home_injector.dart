import 'package:app_core/dependency_injection/dependency_injector.dart';
import 'package:app_core/dependency_injection/service_locator.dart';
import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/core/router/app_route.dart';
import 'package:chasis_admin/core/router/routes.dart';
import 'package:chasis_admin/features/home/presentation/pages/home_page.dart';

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
