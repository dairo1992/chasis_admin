import 'package:chasis_admin/config/platform/platform.dart';
import 'package:chasis_admin/dependency_injection/dependencies_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_commons/app_config/app_config_strategy.dart';
import 'package:flutter_commons/enviromnents/environment_values_provider.dart';
import 'package:flutter_commons/enviromnents/values/environment_values.dart';

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
