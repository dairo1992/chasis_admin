import 'dart:async';

import 'package:get_it/get_it.dart';

abstract class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocatorImpl();

  static ServiceLocator get instance => _instance;

  // Registrar factory de Dependecias
  void registerFactory<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  });

  // Registrar factory de Dependecias con Parametros
  void registerFactoryParams<T extends Object, P1, P2>(
    FactoryFuncParam<T, P1, P2> factoryFunc, {
    String? instanceName,
  });

  // Registrar factory de Dependencias
  void registerLazySingleton<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  });

  // Remover Dependencias
  FutureOr unRegister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T)? disposingFunction,
  });

  // Obtener Dependencias
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
    Type? type,
  });
}

class ServiceLocatorImpl extends ServiceLocator {
  final GetIt _serviceLocator = GetIt.instance;

  @override
  T get<T extends Object>({String? instanceName, param1, param2, Type? type}) {
    return _serviceLocator.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
      type: type,
    );
  }

  @override
  void registerFactory<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerFactory(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerFactoryParams<T extends Object, P1, P2>(
    FactoryFuncParam<T, P1, P2> factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerFactoryParam(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  FutureOr unRegister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T p1)? disposingFunction,
  }) {
    return _serviceLocator.unregister(
      instance: instance,
      instanceName: instanceName,
      disposingFunction: disposingFunction,
    );
  }
}
