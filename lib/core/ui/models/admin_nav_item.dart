import 'package:flutter/widgets.dart';

class AdminNavItem {
  final String id;
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final List<AdminNavItem>? subItems;
  final bool isDisabled;

  const AdminNavItem({
    required this.id,
    required this.icon,
    required this.label,
    this.onTap,
    this.subItems,
    this.isDisabled = false,
  });
}
