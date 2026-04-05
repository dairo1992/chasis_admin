import 'package:flutter_commons/enviromnents/values/client_keys_environment_values.dart';

final class PlatformClientKeysEnvironmentValues {
  const PlatformClientKeysEnvironmentValues({
    required this.mobile,
    required this.web,
  });

  final ClientKeysEnvironmentValues mobile;
  final ClientKeysEnvironmentValues web;
}
