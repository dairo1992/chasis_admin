import 'package:chasis_admin/config/platform/platform_config_app.dart'
    if (dart.library.html) 'package:chasis_admin/config/platform/platform_config_web.dart';
import 'package:flutter_commons/enviromnents/values/environment_values.dart';

abstract class PlatformConfig {
  static PlatformConfig instance = PlatformConfigImpl() as PlatformConfig;

  void start();

  void startUI(EnvironmentValues environmentValues);
}
