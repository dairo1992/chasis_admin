import 'package:flutter_commons/utils/display_platform/base_display_platform_strategy.dart';
import 'package:flutter_commons/utils/display_platform/display_platform_strategy.dart';
import 'package:flutter/widgets.dart';

final class DisplayPlatformProvider {
  static DisplayPlatformProvider _instance = DisplayPlatformProvider._();

  static DisplayPlatformProvider get instance => _instance;

  DisplayPlatformProvider._() : _strategy = BaseDisplayPlatformStrategy();

  DisplayPlatformStrategy _strategy;

  DisplayPlatformStrategy get() => _strategy;

  @visibleForTesting
  void changeStrategy(DisplayPlatformStrategy strategy) => _strategy = strategy;

  @visibleForTesting
  void reset() => _instance = DisplayPlatformProvider._();
}
