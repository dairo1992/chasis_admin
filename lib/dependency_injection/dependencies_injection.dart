import 'package:flutter_commons/dependency_injection/common_dependency_injection.dart';
import 'package:flutter_commons/dependency_injection/dependencies_setup_manager.dart';
import 'package:flutter_commons/dependency_injection/dependency_injector.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:flutter_commons/domain/session_provider.dart';
import 'package:flutter_commons/enviromnents/values/environment_values.dart';

import '../features/auth/dependency_injection/auth_injector.dart';
import '../features/home/dependency_injection/home_injector.dart';

DependenciesSetupManager setUpDependencies(
  EnvironmentValues environmentValues,
) {
  final serviceLocator = ServiceLocator.instance;

  final List<DependencyInjector> injectors = [
    CommonDependencyInjection(serviceLocator: serviceLocator),
    AuthInjector(serviceLocator: serviceLocator),
    HomeInjector(serviceLocator: serviceLocator),
  ];

  for (var item in injectors) {
    item.registerDependencies(environmentValues);
  }

  return DependenciesSetupManager(
    sessionProvider: serviceLocator.get<SessionProvider>(),
  );
}
