import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ShadTheme.of(context).colorScheme.background,
        border: Border(
          top: BorderSide(
            color: ShadTheme.of(context).colorScheme.border,
          ),
        ),
      ),
      child: Center(
        child: Text(
          '© 2026 Chasis Admin. All rights reserved.',
          style: ShadTheme.of(context).textTheme.muted,
        ),
      ),
    );
  }
}
