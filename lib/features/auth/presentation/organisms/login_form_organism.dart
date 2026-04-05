import 'package:chasis_admin/core/ui/widgets/input_password.dart';
import 'package:chasis_admin/features/auth/presentation/bloc/login_bloc.dart';
import 'package:chasis_admin/features/auth/presentation/bloc/login_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginFormOrganism extends StatefulWidget {
  const LoginFormOrganism({super.key});

  @override
  State<LoginFormOrganism> createState() => _LoginFormOrganismState();
}

class _LoginFormOrganismState extends State<LoginFormOrganism> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ShadToaster.of(context).show(
            const ShadToast(description: Text('Sesión iniciada correctamente')),
          );
        } else if (state is LoginFailure) {
          // ShadAlert.destructive(
          //   icon: Icon(LucideIcons.circleAlert),
          //   title: Text('Error'),
          //   description: Text('Your session has expired. Please log in again.'),
          // );
          ShadToaster.of(context).show(
            ShadToast.destructive(
              alignment: Alignment.topRight,
              duration: const Duration(seconds: 8),
              closeIcon: const Icon(LucideIcons.x),
              title: const Text('Error de inicio de sesión'),
              description: Text(state.failure.message),
            ),
          );
        }
      },
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          ShadInput(
            controller: _emailController,
            placeholder: const Text('Correo electrónico'),
            keyboardType: TextInputType.emailAddress,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(LucideIcons.mail, size: 16),
            ),
          ),
          const SizedBox(height: 16),
          ShadInputPassword(controller: _passwordController),
          const SizedBox(height: 16),
          ShadCheckbox(
            value: true,
            onChanged: (v) {},
            label: const Text('Acepto los términos y condiciones'),
            sublabel: const Text(
              'Al iniciar sesión, aceptas nuestros Términos de Servicio y Política de Privacidad.',
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final isLoading = state is LoginLoading;
              return ShadButton(
                onPressed: isLoading
                    ? null
                    : () {
                        context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                child: isLoading
                    ? SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: ShadTheme.of(
                            context,
                          ).colorScheme.primaryForeground,
                        ),
                      )
                    : const Text('Iniciar Sesión'),
              );
            },
          ),
        ],
      ),
    );
  }
}
