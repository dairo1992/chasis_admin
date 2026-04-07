import 'package:chasis_admin/core/ui/organisms/layout/layout_type_defs.dart';
import 'package:flutter/material.dart';

abstract class BaseDisplayTargetWrapper extends StatelessWidget {
  final ScreenBuilder mobileApp;
  final ScreenBuilder mobile;
  final ScreenBuilder tablet;
  final ScreenBuilder desktop;

  const BaseDisplayTargetWrapper({
    super.key,
    ScreenBuilder? mobileApp,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : mobileApp = mobileApp ?? mobile;
}
