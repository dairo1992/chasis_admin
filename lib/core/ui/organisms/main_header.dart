import 'package:app_core/utils/enums/display_target.dart';
import 'package:app_core/utils/extensions/context_display_target_extension.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MainHeader extends StatelessWidget {
  final List<ShadButton>? actions;

  const MainHeader({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ShadTheme.of(context).colorScheme.primary,
        border: Border(
          bottom: BorderSide(color: ShadTheme.of(context).colorScheme.border),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Chasis Admin',
            style: ShadTheme.of(context).textTheme.h4.copyWith(
                  color: ShadTheme.of(context).colorScheme.primaryForeground,
                ),
          ),
          const Spacer(),
          if (actions != null && context.displayTarget == DisplayTarget.desktop)
            ...actions!,
        ],
      ),
    );
  }
}
