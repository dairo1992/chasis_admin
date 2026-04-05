import 'package:flutter_commons/enviromnents/values/api_key_environment_values.dart';
import 'package:flutter_commons/enviromnents/values/platform_client_keys_environment_values.dart';

final class ServerConnectionEnvironmentValues {
  final PlatformClientKeysEnvironmentValues utilitiesClientKeys;

  final String regularBaseUrl;
  final String publicIpServiceUrl;
  final String urlPublishWeb;

  final ApiKeyEnvironmentValues utilitiesAPIKeys;

  const ServerConnectionEnvironmentValues({
    required this.utilitiesClientKeys,
    required this.regularBaseUrl,
    required this.publicIpServiceUrl,
    required this.urlPublishWeb,
    required this.utilitiesAPIKeys,
  });
}
