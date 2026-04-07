import 'package:app_core/utils/display_platform/display_platform.dart';
import 'package:app_core/utils/display_platform/display_platform_provider.dart';
import 'package:chasis_admin/core/ui/organisms/layout/multi_target_layout.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:chasis_admin/core/ui/organisms/main_header.dart';
import 'package:chasis_admin/core/ui/organisms/main_footer.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.web,
    required this.mobile,
    required this.tablet,
    this.headerActions,
    this.headerExceptions = const [],
    this.footerExceptions = const [],
    this.header = const MainHeader(),
    this.footer = const MainFooter(),
  });

  /// Widget for large screens (Web/Desktop)
  final Widget web;

  /// Widget for small screens (Mobile)
  final Widget mobile;

  /// Widget for medium screens (Tablet)
  final Widget tablet;

  /// List of platforms where the header should NOT be displayed.
  final List<DisplayPlatform> headerExceptions;

  /// List of platforms where the footer should NOT be displayed.
  final List<DisplayPlatform> footerExceptions;

  /// Custom header component (defaults to MainHeader)
  final Widget? header;

  /// Custom footer component (defaults to MainFooter)
  final Widget? footer;

  final List<ShadButton>? headerActions;

  @override
  Widget build(BuildContext context) {
    final currentPlatform = DisplayPlatformProvider.instance.get().current;

    final showHeader = !headerExceptions.contains(currentPlatform);
    final showFooter = !footerExceptions.contains(currentPlatform);

    //    final headerActions = [
    //   ShadButton.ghost(
    //     onPressed: () {},
    //     hoverBackgroundColor: theme.colorScheme.foreground,
    //     child: Icon(
    //       LucideIcons.user,
    //       size: 16,
    //       color: theme.colorScheme.primaryForeground,
    //     ),
    //   ),
    //   ShadButton.ghost(
    //     onPressed: () {},
    //     hoverBackgroundColor: theme.colorScheme.foreground,
    //     child: Icon(
    //       LucideIcons.logOut,
    //       size: 16,
    //       color: theme.colorScheme.primaryForeground,
    //     ),
    //   ),
    // ],

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (showHeader && header != null) header!,
            Expanded(
              child: ShadResponsiveBuilder(
                builder: (context, breakpoint) {
                  return MultiTargetLayout(
                    desktop: () => web,
                    tablet: () => tablet,
                    mobile: () => mobile,
                  );
                },
              ),
            ),
            if (showFooter && footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
