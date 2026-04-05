import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: ShadTheme.of(context).textTheme.h3),
        actions: [
          ShadButton.outline(
            onPressed: () {
              // Logout logic for later
            },
            child: const Icon(LucideIcons.logOut),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.layoutGrid, size: 64),
            const SizedBox(height: 16),
            Text(
              'Bienvenido al Panel Administrativo',
              style: ShadTheme.of(context).textTheme.h4,
            ),
            const SizedBox(height: 8),
            Text(
              'Aquí podrás gestionar los servicios de Chasis.',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
