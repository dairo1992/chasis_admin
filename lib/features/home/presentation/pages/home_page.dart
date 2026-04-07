import 'package:chasis_admin/core/ui/templates/app_scaffold.dart';
import 'package:chasis_admin/core/ui/config/nav_items_config.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navItems: getAdminNavItems(context),
      selectedNavId: 'home',
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dashboard', style: theme.textTheme.h1),
          const SizedBox(height: 16),
          Text(
            'Bienvenido al panel de administración del Chasis.',
            style: theme.textTheme.lead,
          ),
          const SizedBox(height: 32),
          ShadCard(
            title: const Text('Resumen de Actividad'),
            description: const Text(
              'Visualiza el estado actual de tus servicios.',
            ),
            footer: ShadButton(
              onPressed: () {},
              child: const Text('Ver Detalles Completos'),
            ),
            child: const Column(
              children: [
                _StatusRow(label: 'Servidor Principal', isOnline: true),
                Divider(),
                _StatusRow(label: 'Base de Datos', isOnline: true),
                Divider(),
                _StatusRow(label: 'Servicios de Auth', isOnline: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final bool isOnline;

  const _StatusRow({required this.label, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.p),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: isOnline
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              isOnline ? 'ONLINE' : 'OFFLINE',
              style: theme.textTheme.small.copyWith(
                color: isOnline ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
