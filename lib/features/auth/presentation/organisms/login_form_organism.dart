import 'package:chasis_admin/core/ui/widgets/input_password.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginFormOrganism extends StatelessWidget {
  final void Function()? onLoginPressed;
  final bool isLoading;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onRememberMeChanged;
  final bool rememberMe;

  const LoginFormOrganism({
    super.key,
    this.onLoginPressed,
    required this.isLoading,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onRememberMeChanged,
    required this.rememberMe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        ShadInput(
          placeholder: const Text('Correo electrónico'),
          keyboardType: TextInputType.emailAddress,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(LucideIcons.mail, size: 16),
          ),
        ),
        const SizedBox(height: 16),
        ShadInputPassword(),
        const SizedBox(height: 16),
        ShadCheckbox(
          value: rememberMe,
          onChanged: onRememberMeChanged,
          label: const Text('Recordarme'),
        ),
        const SizedBox(height: 24),
        ShadButton(
          onPressed: isLoading ? null : onLoginPressed,
          child: isLoading
              ? SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: ShadTheme.of(context).colorScheme.primaryForeground,
                  ),
                )
              : const Text('Iniciar Sesión'),
        ),
      ],
    );
  }
}
