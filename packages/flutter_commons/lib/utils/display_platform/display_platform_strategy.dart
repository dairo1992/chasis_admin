import 'package:flutter_commons/utils/display_platform/display_platform.dart';

abstract class DisplayPlatformStrategy {
  DisplayPlatform get current;

  bool get isApp;
  bool get isWeb;
}
