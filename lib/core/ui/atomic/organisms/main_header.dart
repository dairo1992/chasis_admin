import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ShadTheme.of(context).colorScheme.background,
        border: Border(
          bottom: BorderSide(color: ShadTheme.of(context).colorScheme.border),
        ),
      ),
      child: Row(
        children: [
          Text('Chasis Admin', style: ShadTheme.of(context).textTheme.h4),
          const Spacer(),
          ShadButton.ghost(
            //icon: const Icon(LucideIcons.user, size: 16),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
