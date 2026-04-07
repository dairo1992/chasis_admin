import 'package:chasis_admin/core/ui/models/admin_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
      width: 96,
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
            width: 48,
            height: 48,
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
                return _AdminNavItemWidget(
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
    final displayedItems = items.length > 5 ? items.sublist(0, 4) : items;
    final moreItems = items.length > 5 ? items.sublist(4) : <AdminNavItem>[];

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
            ...displayedItems.map((item) => _AdminNavItemWidget(
                  item: item,
                  isSelected: item.id == selectedId,
                  isVertical: false,
                  side: ShadSheetSide.bottom,
                )),
            if (moreItems.isNotEmpty) _MoreMenuButton(items: moreItems),
          ],
        ),
      ),
    );
  }
}

class _AdminNavItemWidget extends StatelessWidget {
  final AdminNavItem item;
  final bool isSelected;
  final bool isVertical;
  final ShadSheetSide side;

  const _AdminNavItemWidget({
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
      width: 80,
      height: 60,
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
        description: const Text('Seleccione una opción'),
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

class _MoreMenuButton extends StatelessWidget {
  final List<AdminNavItem> items;

  const _MoreMenuButton({required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadButton.ghost(
      height: 60,
      onPressed: () {
        showShadSheet(
          context: context,
          side: ShadSheetSide.bottom,
          builder: (context) => ShadSheet(
            title: const Text('Más Opciones'),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
            'Más',
            style: theme.textTheme.small.copyWith(
                fontSize: 10, color: theme.colorScheme.mutedForeground),
          ),
        ],
      ),
    );
  }
}
