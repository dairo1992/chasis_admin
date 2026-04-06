import 'package:chasis_admin/core/ui/atomic/templates/responsive_main_template.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      headerActions: [
        ShadButton.ghost(
          onPressed: () {},
          hoverBackgroundColor: ShadTheme.of(context).colorScheme.foreground,
          child: Icon(
            LucideIcons.user,
            size: 16,
            color: ShadTheme.of(context).colorScheme.primaryForeground,
          ),
        ),
        // const SizedBox(width: 8),
        ShadButton.ghost(
          onPressed: () {},
          hoverBackgroundColor: ShadTheme.of(context).colorScheme.foreground,
          child: Icon(
            LucideIcons.logOut,
            size: 16,
            color: ShadTheme.of(context).colorScheme.primaryForeground,
          ),
        ),
      ],
      web: _buildWeb(context),
      mobile: _buildMobile(context),
      tablet: _buildTablet(context),
    );
  }

  Widget _buildWeb(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget _buildMobile(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget _buildTablet(BuildContext context) {
    return const SizedBox.shrink();
  }
}
