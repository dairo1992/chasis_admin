import 'package:chasis_admin/features/auth/presentation/organisms/login_form_organism.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginMobileTemplate extends StatelessWidget {
  const LoginMobileTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ShadCard(
          title: Text('Bienvenido', style: ShadTheme.of(context).textTheme.h3),
          description: const Text('Ingresa tus credenciales para continuar'),
          child: const LoginFormOrganism(),
        ),
      ),
    );
  }
}
