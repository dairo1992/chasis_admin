import 'package:app_core/data/storage/local_storage.dart';
import 'package:app_core/dependency_injection/dependency_injector.dart';
import 'package:app_core/dependency_injection/service_locator.dart';
import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/core/router/app_route.dart';
import 'package:chasis_admin/core/router/routes.dart';
import 'package:chasis_admin/features/auth/domain/usecases/get_remember_use_case.dart';
import 'package:chasis_admin/features/auth/domain/usecases/remember_use_case.dart';
import 'package:chasis_admin/features/auth/presentation/bloc/login_bloc.dart';

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
      () => AuthRepositoryImpl(
          localStorageDataSource: serviceLocator.get<LocalStorageDataSource>()),
    );
  }

  void _registerProviders() {}

  void _registerServices() {}

  void _registerUseCases() {
    serviceLocator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: serviceLocator.get<AuthRepository>()),
    );
    serviceLocator.registerLazySingleton<GetRememberMeUseCase>(
      () => GetRememberMeUseCase(
          repository: serviceLocator.get<AuthRepository>()),
    );
    serviceLocator.registerLazySingleton<RememberUseCase>(
      () => RememberUseCase(repository: serviceLocator.get<AuthRepository>()),
    );
  }

  void _registerBlocs() {
    serviceLocator.registerFactory<LoginBloc>(
      () => LoginBloc(
        loginUseCase: serviceLocator.get<LoginUseCase>(),
        getRememberMeUseCase: serviceLocator.get<GetRememberMeUseCase>(),
        rememberUseCase: serviceLocator.get<RememberUseCase>(),
      ),
    );
  }
}
