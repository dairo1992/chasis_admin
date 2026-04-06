import 'dart:async';

import 'package:app_core/dependency_injection/service_locator.dart';
import 'package:get_it/get_it.dart';

class ServiceLocatorImpl extends ServiceLocator {
  static final ServiceLocator _instance = ServiceLocatorImpl();
  final GetIt _serviceLocator = GetIt.instance;

  static ServiceLocator get instance => _instance;

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
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
  }) {
    _serviceLocator.registerSingleton<T>(
      instance,
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
