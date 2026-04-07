import 'package:chasis_admin/core/ui/models/admin_nav_item.dart';
import 'package:chasis_admin/core/ui/utils/constants.dart';
import 'package:chasis_admin/core/ui/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MoreMenuButton extends StatelessWidget {
  final List<AdminNavItem> items;

  const MoreMenuButton({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadButton.ghost(
      height: CoreConstants.navItemHeight,
      onPressed: () {
        showShadSheet(
          context: context,
          side: ShadSheetSide.bottom,
          builder: (context) => ShadSheet(
            title: const Text(CoreStrings.moreOptions),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: items
                      .map((item) => ListTile(
                            leading: Icon(item.icon),
                            title: Text(item.label),
                            onTap: () {
                              Navigator.pop(context);
                              if (item.onTap != null) item.onTap!();
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            LucideIcons.plus,
            size: 24,
            color: theme.colorScheme.mutedForeground,
          ),
          const SizedBox(height: 4),
          Text(
            CoreStrings.more,
            style: theme.textTheme.small.copyWith(
                fontSize: 10, color: theme.colorScheme.mutedForeground),
          ),
        ],
      ),
    );
  }
}
