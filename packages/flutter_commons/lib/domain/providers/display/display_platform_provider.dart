import 'package:flutter_commons/utils/display_platform/display_platform.dart';

abstract class DisplayPlatformProvider {
  DisplayPlatform get current;

  bool get isWeb;

  bool get isApp;
}
