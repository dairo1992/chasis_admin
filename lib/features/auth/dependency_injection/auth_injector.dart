import 'package:chasis_admin/features/auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_commons/dependency_injection/dependency_injector.dart';
import 'package:flutter_commons/enviromnents/values/environment_values.dart';
import 'package:flutter_commons/router/app_route.dart';
import 'package:flutter_commons/router/routes.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';

import '../domain/repositories/auth_repository.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/login_use_case.dart';
import '../presentation/pages/login_page.dart';

class AuthInjector implements DependencyInjector {
  final ServiceLocator serviceLocator;

  AuthInjector({required this.serviceLocator});

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
    serviceLocator.registerLazySingleton<AppRoute>(
      () => AppRoute(route: Routes.authentication, page: const LoginPage()),
      instanceName: Routes.authentication.name,
    );
  }

  void _registerInterceptors() {}

  void _registerEnvironment() {}

  void _registerDataSources() {}

  void _registerRepositories() {
    serviceLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(),
    );
  }

  void _registerProviders() {}

  void _registerServices() {}

  void _registerUseCases() {
    serviceLocator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(serviceLocator.get<AuthRepository>()),
    );
  }

  void _registerBlocs() {
    serviceLocator.registerFactory<LoginBloc>(
      () => LoginBloc(loginUseCase: serviceLocator.get<LoginUseCase>()),
    );
  }
}

//  // Repositories
//     serviceLocator.registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(),
//     );

//     // Use cases
//     serviceLocator.registerLazySingleton(
//       () => LoginUseCase(serviceLocator.get<AuthRepository>()),
//     );

//     // Route
