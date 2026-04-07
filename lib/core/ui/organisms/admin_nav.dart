import 'package:chasis_admin/core/ui/models/admin_nav_item.dart';
import 'package:chasis_admin/core/ui/utils/constants.dart';
import 'package:chasis_admin/core/ui/molecules/admin_nav_item_widget.dart';
import 'package:chasis_admin/core/ui/molecules/more_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'admin_sidebar.dart';
part 'admin_bottom_nav.dart';

class AdminNav extends StatelessWidget {
  final List<AdminNavItem> items;
  final String selectedId;

  const AdminNav({
    super.key,
    required this.items,
    this.selectedId = '',
  });

  @override
  Widget build(BuildContext context) {
    return ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        if (breakpoint >= ShadTheme.of(context).breakpoints.lg) {
          return _AdminSidebar(items: items, selectedId: selectedId);
        }
        return _AdminBottomNav(items: items, selectedId: selectedId);
      },
    );
  }
}
