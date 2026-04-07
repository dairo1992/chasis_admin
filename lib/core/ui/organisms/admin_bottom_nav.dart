part of 'admin_nav.dart';

class _AdminBottomNav extends StatelessWidget {
  final List<AdminNavItem> items;
  final String selectedId;

  const _AdminBottomNav({
    required this.items,
    required this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final displayedItems = items.length > CoreConstants.maxBottomNavItems
        ? items.sublist(0, CoreConstants.displayedBottomNavItems)
        : items;
    final moreItems = items.length > CoreConstants.maxBottomNavItems
        ? items.sublist(CoreConstants.displayedBottomNavItems)
        : <AdminNavItem>[];

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          top: BorderSide(color: theme.colorScheme.border),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...displayedItems.map((item) => AdminNavItemWidget(
                  item: item,
                  isSelected: item.id == selectedId,
                  isVertical: false,
                  side: ShadSheetSide.bottom,
                )),
            if (moreItems.isNotEmpty) MoreMenuButton(items: moreItems),
          ],
        ),
      ),
    );
  }
}
