import 'package:flutter_commons/enviromnents/values/environment_values.dart';
import 'package:flutter_commons/enviromnents/values/token_sync_values.dart';

class EnvironmentValuesProvider {
  const EnvironmentValuesProvider._();

  static EnvironmentValuesProvider get instance => _instance;

  static const EnvironmentValuesProvider _instance =
      EnvironmentValuesProvider._();

  EnvironmentValues get() {
    return EnvironmentValues(tokenSync: _getTokenSyncValues());
  }

  TokenSyncValues _getTokenSyncValues() {
    return const TokenSyncValues(
      tokenSync: String.fromEnvironment('TOKEN_SYNC'),
      endFlowKeyOne: String.fromEnvironment('TOKEN_SYNC_END_OF_FLOW_KEY_ONE'),
      endFlowKeyTwo: String.fromEnvironment('TOKEN_SYNC_END_OF_FLOW_KEY_TWO'),
    );
  }
}
