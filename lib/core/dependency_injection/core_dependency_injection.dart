import 'package:app_core/dependency_injection/dependency_injector.dart';
import 'package:app_core/dependency_injection/service_locator.dart';
import 'package:app_core/domain/providers/session_provider.dart';
import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/core/data/providers/session/session_provider_impl.dart';
import 'package:chasis_admin/core/router/redirection_handlers/implementations/route_data_validation_redirection_handler.dart';
import 'package:chasis_admin/core/router/redirection_handlers/implementations/session_validation_redirection_handler.dart';
import 'package:chasis_admin/core/router/redirection_handlers/redirection_handler_factory.dart';
import 'package:chasis_admin/core/router/route_observer/app_route_observer.dart';

final class CoreDependencyInjection extends DependencyInjector {
  final ServiceLocator serviceLocator;

  CoreDependencyInjection({required this.serviceLocator});

  @override
  void registerDependencies(EnvironmentValues environmentValues) {
    _registerRoutes();
    _registerInterceptors();
    _registerEnvironment();
    _registerDataSources();
    _registerRepositories();
    _registerProviders();
    _registerServices();
    _registerUseCases();
    _registerBlocs();
  }

  void _registerRoutes() {
    serviceLocator.registerLazySingleton<AppRouteObserver>(
      () => AppRouteObserver(),
    );
    serviceLocator.registerFactory(
      () => RouteDataValidationRedirectionHandler.init(),
    );
    serviceLocator.registerFactory(
      () => SessionValidationRedirectionHandler.init(
        sessionProvider: serviceLocator.get(),
        tokensProvider: serviceLocator.get(),
      ),
    );
    serviceLocator.registerFactory(
      () => RedirectionHandlerFactory(
        routeDataValidationRedirectionHandler: serviceLocator.get(),
      ),
    );
  }

  void _registerInterceptors() {}

  void _registerEnvironment() {}

  void _registerDataSources() {}

  void _registerRepositories() {}

  void _registerServices() {}

  void _registerProviders() {
    serviceLocator.registerLazySingleton<SessionProvider>(
      () => SessionProviderImpl(),
    );
  }

  void _registerUseCases() {}

  void _registerBlocs() {}
}
