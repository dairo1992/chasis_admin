import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A component that wraps its child in a centered, constrained-width container
/// with responsive margins.
///
/// Equivalent to legacy MaterialSection but for Shadcn UI.
class AdminContentSection extends StatelessWidget {
  final Widget child;
  
  /// Max width for the content area on large screens.
  final double maxWidth;
  
  /// Whether to use the full width regardless of breakpoints.
  final bool fullWidth;

  const AdminContentSection({
    super.key,
    required this.child,
    this.maxWidth = 1280,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    if (fullWidth) return child;

    return ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        final theme = ShadTheme.of(context);
        
        // Define margins based on breakpoints
        double horizontalMargin = 16.0; // Mobile default
        
        if (breakpoint >= theme.breakpoints.lg) {
          horizontalMargin = 32.0; // Desktop
        } else if (breakpoint >= theme.breakpoints.md) {
          horizontalMargin = 24.0; // Tablet
        }

        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
