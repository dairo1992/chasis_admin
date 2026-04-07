import 'package:app_core/utils/display_platform/display_platform.dart';
import 'package:app_core/utils/enums/display_target.dart';
import 'package:app_core/utils/extensions/context_display_target_extension.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/layout/base_display_target_wrapper.dart';
import 'package:flutter/material.dart';

class DisplayTargetWrapper extends BaseDisplayTargetWrapper {
  const DisplayTargetWrapper({
    super.key,
    required super.mobileApp,
    required super.mobile,
    required super.tablet,
    required super.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return switch (context.displayTarget.platform) {
      DisplayPlatform.app => switch (context.displayTarget) {
          DisplayTarget.mobile => mobileApp(),
          DisplayTarget.tablet => tablet(),
          DisplayTarget.desktop => desktop(),
        },
      DisplayPlatform.web => switch (context.displayTarget) {
          DisplayTarget.mobile => mobile(),
          DisplayTarget.tablet => tablet(),
          DisplayTarget.desktop => desktop(),
        },
    };
  }
}
