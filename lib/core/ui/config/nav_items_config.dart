import 'package:chasis_admin/core/router/routes.dart';
import 'package:chasis_admin/core/ui/models/admin_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

List<AdminNavItem> getAdminNavItems(BuildContext context) {
  return [
    AdminNavItem(
      id: Routes.home.name,
      icon: Icons.home,
      label: 'Inicio',
      onTap: () => context.goNamed(Routes.home.name),
    ),
    AdminNavItem(
      id: Routes.users.name,
      icon: LucideIcons.users,
      label: 'Usuarios',
      onTap: () => context.goNamed(Routes.users.name),
    ),
    // Additional items can be added here
    AdminNavItem(
      id: 'settings',
      icon: LucideIcons.settings,
      label: 'Ajustes',
    ),
  ];
}
