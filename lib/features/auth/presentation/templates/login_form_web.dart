import 'package:chasis_admin/features/auth/presentation/organisms/login_form_organism.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginWebTemplate extends StatelessWidget {
  const LoginWebTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ShadTheme.of(context).colorScheme.primary,
                  ShadTheme.of(context).colorScheme.ring,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.shieldCheck,
                    size: 120,
                    color: ShadTheme.of(context).colorScheme.primaryForeground,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Chasis Admin',
                    style: ShadTheme.of(context).textTheme.h1.copyWith(
                      color: ShadTheme.of(
                        context,
                      ).colorScheme.primaryForeground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: ShadCard(
              width: 700,
              //height: 400,
              title: Text(
                'Bienvenido',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              description: const Text(
                'Ingresa tus credenciales para continuar',
              ),
              child: const LoginFormOrganism(),
            ),
          ),
        ),
      ],
    );
  }
}
