import 'package:app_core/utils/display_platform/display_platform.dart';
import 'package:app_core/utils/display_platform/display_platform_provider.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/admin_content_section.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/layout/layout_type_defs.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A responsive body component that routes layout based on screen size (breakpoints)
/// and platform type.
///
/// Ported from legacy MultiTargetLayoutBody but modernized for Shadcn UI.
class MultiTargetLayout extends StatelessWidget {
  /// A builder used for ALL screen sizes if provided.
  final ScreenBuilder? singleScreen;

  /// A builder specific to mobile apps (e.g., when running on iOS/Android).
  final ScreenBuilder? mobileApp;

  /// A builder for small screens (mobile).
  final ScreenBuilder? mobile;

  /// A builder for medium screens (tablet).
  final ScreenBuilder? tablet;

  /// A builder for large screens (desktop).
  final ScreenBuilder? desktop;

  /// Whether to use the Material layout (wraps in a Material widget).
  final bool canUseMaterialLayout;

  /// Whether to wrap the content in an [AdminContentSection] (max width/margins).
  final bool useContentSection;

  const MultiTargetLayout({
    super.key,
    this.singleScreen,
    this.mobileApp,
    this.mobile,
    this.tablet,
    this.desktop,
    this.canUseMaterialLayout = false,
    this.useContentSection = false,
  });

  @override
  Widget build(BuildContext context) {
    if (singleScreen != null) {
      return _wrapContent(context, singleScreen!());
    }

    final platform = DisplayPlatformProvider.instance.get().current;

    return ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        final theme = ShadTheme.of(context);

        Widget result;

        // Desktop (Large)
        if (breakpoint >= theme.breakpoints.lg) {
          result = _unwrapScreenBuilder(context, desktop ?? tablet ?? mobile);
        }

        // Tablet (Medium)
        else if (breakpoint >= theme.breakpoints.md) {
          result = _unwrapScreenBuilder(context, tablet ?? mobile);
        }

        // Mobile (Small)
        else {
          if (platform == DisplayPlatform.app && mobileApp != null) {
            result = mobileApp!();
          } else {
            result = _unwrapScreenBuilder(context, mobile ?? mobileApp);
          }
        }

        return _wrapContent(context, result);
      },
    );
  }

  Widget _wrapContent(BuildContext context, Widget content) {
    Widget result = content;

    // Apply ContentSection if requested
    if (useContentSection) {
      result = AdminContentSection(child: result);
    }

    // Apply Material wrapper if requested
    if (canUseMaterialLayout) {
      result = Material(child: result);
    }

    return result;
  }

  Widget _unwrapScreenBuilder(BuildContext context, ScreenBuilder? builder) {
    if (builder != null) return builder();

    // Final fallback logic
    final fallback = desktop ?? tablet ?? mobile ?? mobileApp;
    if (fallback != null) return fallback();

    throw UnimplementedError(
      'No se ha definido un builder para el target actual en MultiTargetLayout',
    );
  }
}
