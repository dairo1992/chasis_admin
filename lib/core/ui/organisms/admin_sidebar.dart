part of 'admin_nav.dart';

class _AdminSidebar extends StatelessWidget {
  final List<AdminNavItem> items;
  final String selectedId;

  const _AdminSidebar({
    required this.items,
    required this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      width: CoreConstants.sidebarWidth,
      height: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          right: BorderSide(color: theme.colorScheme.border),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            width: CoreConstants.sidebarIconContainerSize,
            height: CoreConstants.sidebarIconContainerSize,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.shieldCheck,
              color: theme.colorScheme.primaryForeground,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = items[index];
                return AdminNavItemWidget(
                  item: item,
                  isSelected: item.id == selectedId,
                  isVertical: true,
                  side: ShadSheetSide.left,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
