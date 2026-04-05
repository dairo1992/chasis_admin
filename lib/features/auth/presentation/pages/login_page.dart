import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_commons/utils/display_platform/display_platform.dart';
import 'package:chasis_admin/core/ui/atomic/templates/responsive_main_template.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => ServiceLocator.instance.get<LoginBloc>(),
      child: ResponsiveMainTemplate(
        // Hide header and footer on login page
        headerExceptions: const [DisplayPlatform.app, DisplayPlatform.web],
        footerExceptions: const [DisplayPlatform.app, DisplayPlatform.web],

        web: Row(
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
                        color: ShadTheme.of(
                          context,
                        ).colorScheme.primaryForeground,
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
                  height: 350,
                  title: Text(
                    'Bienvenido',
                    style: ShadTheme.of(context).textTheme.h3,
                  ),
                  description: const Text(
                    'Ingresa tus credenciales para continuar',
                  ),
                  child: const LoginForm(),
                ),
              ),
            ),
          ],
        ),
        mobile: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ShadCard(
              title: Text(
                'Bienvenido',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              description: const Text(
                'Ingresa tus credenciales para continuar',
              ),
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Error de inicio de sesión'),
              description: Text(state.failure.message),
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ShadInput(
            controller: _passwordController,
            placeholder: const Text('Contraseña'),
            obscureText: true,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(LucideIcons.lock, size: 16),
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return ShadButton(
                onPressed: state is LoginLoading
                    ? null
                    : () {
                        context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                child: state is LoginLoading
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
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
