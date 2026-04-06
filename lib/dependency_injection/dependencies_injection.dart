import 'package:flutter_commons/dependency_injection/common_dependency_injection.dart';
import 'package:flutter_commons/dependency_injection/dependencies_setup_manager.dart';
import 'package:flutter_commons/dependency_injection/dependency_injector.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:flutter_commons/domain/session_provider.dart';
import 'package:flutter_commons/enviromnents/values/environment_values.dart';

import '../features/auth/dependency_injection/auth_injector.dart';
import '../features/home/dependency_injection/home_injector.dart';
import 'package:chasis_admin/core/data/models/local_storage_model.dart';
import 'package:chasis_admin/core/data/data_sources/storage/local_data_storage_data_source_impl.dart';
import 'package:flutter_commons/data/data_sources/local/storages/local_storage_data_source.dart';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';

Future<DependenciesSetupManager> setUpDependencies(
  EnvironmentValues environmentValues,
) async {
  final serviceLocator = ServiceLocator.instance;

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
