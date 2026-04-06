import 'package:chasis_admin/core/ui/widgets/input_password.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginFormOrganism extends StatefulWidget {
  final void Function()? onLoginPressed;
  final bool isLoading;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onRememberMeChanged;
  final bool rememberMe;
  final String email;

  const LoginFormOrganism({
    super.key,
    this.onLoginPressed,
    required this.isLoading,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onRememberMeChanged,
    required this.rememberMe,
    required this.email,
  });

  @override
  State<LoginFormOrganism> createState() => _LoginFormOrganismState();
}

class _LoginFormOrganismState extends State<LoginFormOrganism> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void didUpdateWidget(covariant LoginFormOrganism oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.email != widget.email &&
        _emailController.text != widget.email) {
      _emailController.text = widget.email;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        ShadInput(
          controller: _emailController,
          onChanged: widget.onEmailChanged,
          placeholder: const Text('Correo electrónico'),
          keyboardType: TextInputType.emailAddress,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(LucideIcons.mail, size: 16),
          ),
        ),
        const SizedBox(height: 16),
        ShadInputPassword(
          onChanged: widget.onPasswordChanged,
        ),
        const SizedBox(height: 16),
        ShadCheckbox(
          value: widget.rememberMe,
          onChanged: widget.onRememberMeChanged,
          label: const Text('Recordarme'),
        ),
        const SizedBox(height: 24),
        ShadButton(
          onPressed: widget.isLoading ? null : widget.onLoginPressed,
          child: widget.isLoading
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
