import 'package:chasis_admin/core/ui/models/admin_nav_item.dart';
import 'package:chasis_admin/core/ui/utils/constants.dart';
import 'package:chasis_admin/core/ui/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AdminNavItemWidget extends StatelessWidget {
  final AdminNavItem item;
  final bool isSelected;
  final bool isVertical;
  final ShadSheetSide side;

  const AdminNavItemWidget({
    required this.item,
    required this.isSelected,
    required this.isVertical,
    required this.side,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          item.icon,
          size: 24,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.mutedForeground,
        ),
        const SizedBox(height: 4),
        Text(
          item.label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.small.copyWith(
            fontSize: 10,
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.mutedForeground,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );

    return ShadButton.ghost(
      width: CoreConstants.navItemWidth,
      height: CoreConstants.navItemHeight,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      hoverBackgroundColor: theme.colorScheme.primary,
      onPressed: item.isDisabled
          ? null
          : () {
              if (item.subItems != null && item.subItems!.isNotEmpty) {
                _showSubMenu(context);
              } else if (item.onTap != null) {
                item.onTap!();
              }
            },
      child: content,
    );
  }

  void _showSubMenu(BuildContext context) {
    showShadSheet(
      context: context,
      side: side,
      builder: (context) => ShadSheet(
        constraints: const BoxConstraints(maxWidth: 250),
        title: Text(item.label),
        description: const Text(CoreStrings.selectOption),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: item.subItems!
                  .map((subItem) => ListTile(
                        leading: Icon(subItem.icon),
                        title: Text(subItem.label),
                        onTap: () {
                          Navigator.pop(context);
                          if (subItem.onTap != null) subItem.onTap!();
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
