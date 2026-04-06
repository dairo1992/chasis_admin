import 'package:app_core/data/storage/local_storage.dart';
import 'package:app_core/dependency_injection/dependencies_setup_manager.dart';
import 'package:app_core/dependency_injection/dependency_injector.dart';
import 'package:app_core/domain/providers/session_provider.dart';
import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/core/dependency_injection/core_dependency_injection.dart';
import 'package:chasis_admin/core/data/models/local_storage_model.dart';
import 'package:chasis_admin/core/data/data_sources/storage/local_data_storage_data_source_impl.dart';
import 'package:chasis_admin/core/services/services_locator_impl.dart';
import 'package:chasis_admin/features/auth/dependency_injection/auth_injector.dart';
import 'package:chasis_admin/features/home/dependency_injection/home_injector.dart';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';

Future<DependenciesSetupManager> setUpDependencies(
  EnvironmentValues environmentValues,
) async {
  final serviceLocator = ServiceLocatorImpl.instance;

  // Initialize Hive
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(LocalStorageModelAdapter());
  }

  final box = await Hive.openBox<LocalStorageModel>('local_storage');

  // Register Box and Data Source
  serviceLocator.registerSingleton<Box<LocalStorageModel>>(box);
  serviceLocator.registerLazySingleton<LocalStorageDataSource>(
    () => LocalDataStorageDataSourceImpl(box: box),
  );

  final List<DependencyInjector> injectors = [
    CoreDependencyInjection(serviceLocator: serviceLocator),
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
