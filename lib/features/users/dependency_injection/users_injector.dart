import 'package:app_core/dependency_injection/dependency_injector.dart';
import 'package:app_core/dependency_injection/service_locator.dart';
import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/core/router/app_route.dart';
import 'package:chasis_admin/core/router/routes.dart';
import 'package:chasis_admin/features/users/data/repositories/in_memory_user_repository_impl.dart';
import 'package:chasis_admin/features/users/domain/repositories/user_repository.dart';
import 'package:chasis_admin/features/users/presentation/bloc/users_bloc.dart';
import 'package:chasis_admin/features/users/presentation/pages/users_page.dart';

class UsersInjector extends DependencyInjector {
  final ServiceLocator _serviceLocator;

  UsersInjector({required ServiceLocator serviceLocator}) : _serviceLocator = serviceLocator;

  @override
  void registerDependencies(EnvironmentValues environmentValues) {
    // Repositories
    _serviceLocator.registerLazySingleton<UserRepository>(
      () => InMemoryUserRepositoryImpl(),
    );

    // Blocs
    _serviceLocator.registerFactory<UsersBloc>(
      () => UsersBloc(userRepository: _serviceLocator.get<UserRepository>()),
    );

    // Users Route
    _serviceLocator.registerLazySingleton<AppRoute>(
      () => AppRoute(
        route: Routes.users,
        page: const UsersPage(),
      ),
      instanceName: Routes.users.name,
    );
  }
}
