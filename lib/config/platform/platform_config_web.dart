// ignore_for_file: avoid_web_libraries_in_flutter
// ignore: deprecated_member_use
import 'dart:js';
import 'package:flutter/rendering.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:app_core/enviromnents/values/environment_values.dart';
import 'package:chasis_admin/config/platform/platform.dart';

class PlatformConfigImpl extends PlatformConfig {
  @override
  void start() {
    setUrlStrategy(NoHistoryUrlStrategy());
  }

  @override
  void startUI(EnvironmentValues environmentValues) {
    try {
      _initializeRUM(environmentValues);
      SemanticsBinding.instance.ensureSemantics();
    } catch (_) {}
  }

  void _initializeRUM(EnvironmentValues environmentValues) {
    final rumInitializeParams = [environmentValues.tokenSync];

    context.callMethod('RUMInitializer', rumInitializeParams);
  }
}

class NoHistoryUrlStrategy extends PathUrlStrategy {
  @override
  void pushState(Object? state, String title, String url) =>
      replaceState(state, title, url);
}
