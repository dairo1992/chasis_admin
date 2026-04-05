import 'package:chasis_admin/features/auth/presentation/organisms/login_form_organism.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginWebTemplate extends StatelessWidget {
  final void Function()? onLoginPressed;
  final bool isLoading;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onRememberMeChanged;
  final bool rememberMe;

  const LoginWebTemplate({
    super.key,
    required this.isLoading,
    required this.onLoginPressed,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onRememberMeChanged,
    required this.rememberMe,
  });

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
                    size: 130,
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
        Padding(
          padding: const EdgeInsets.all(15),
          child: ShadCard(
            width: 700,
            height: 400,
            title: Text(
              'Bienvenido',
              style: ShadTheme.of(context).textTheme.h3,
            ),
            description: const Text('Ingresa tus credenciales para continuar'),
            child: LoginFormOrganism(
              isLoading: isLoading,
              onLoginPressed: onLoginPressed,
              onEmailChanged: onEmailChanged,
              onPasswordChanged: onPasswordChanged,
              onRememberMeChanged: onRememberMeChanged,
              rememberMe: rememberMe,
            ),
          ),
        ),
      ],
    );
  }
}
