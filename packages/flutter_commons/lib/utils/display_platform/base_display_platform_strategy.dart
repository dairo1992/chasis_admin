import 'package:flutter/foundation.dart';
import 'package:flutter_commons/utils/display_platform/display_platform.dart';
import 'package:flutter_commons/utils/display_platform/display_platform_strategy.dart';

final class BaseDisplayPlatformStrategy implements DisplayPlatformStrategy {
  @override
  DisplayPlatform get current =>
      kIsWeb ? DisplayPlatform.web : DisplayPlatform.app;

  @override
  bool get isApp => current == DisplayPlatform.app;

  @override
  bool get isWeb => current == DisplayPlatform.web;
}
