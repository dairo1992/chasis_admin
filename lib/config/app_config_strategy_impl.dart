import 'package:app_core/app_config/app_config_strategy.dart';
import 'package:app_core/enviromnents/environment_values_provider.dart';
import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/config/platform/platform.dart';
import 'package:chasis_admin/dependency_injection/dependencies_injection.dart';
import 'package:flutter/cupertino.dart';

class AppConfigStrategyImpl extends AppConfigStrategy {
  EnvironmentValues get _environmentValues {
    return EnvironmentValuesProvider.instance.get();
  }

  @override
  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    PlatformConfig.instance.start();

    final configManager = await setUpDependencies(_environmentValues);
    await configManager.start();
  }

  @override
  void startUI() {
    PlatformConfig.instance.startUI(_environmentValues);
  }
}
