import 'package:chasis_admin/features/auth/presentation/organisms/login_form_organism.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginMobileTemplate extends StatelessWidget {
  final void Function()? onLoginPressed;
  final bool isLoading;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onRememberMeChanged;
  final bool rememberMe;

  const LoginMobileTemplate({
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ShadCard(
          title: Text('Bienvenido', style: ShadTheme.of(context).textTheme.h3),
          description: const Text('Ingresa tus credenciales para continuar'),
          child: LoginFormOrganism(
            rememberMe: rememberMe,
            isLoading: isLoading,
            onLoginPressed: onLoginPressed,
            onEmailChanged: onEmailChanged,
            onPasswordChanged: onPasswordChanged,
            onRememberMeChanged: onRememberMeChanged,
          ),
        ),
      ),
    );
  }
}
