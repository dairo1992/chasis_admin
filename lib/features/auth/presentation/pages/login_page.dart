import 'package:chasis_admin/features/auth/presentation/layout/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) =>
          ServiceLocator.instance.get<LoginBloc>()..add(const LoginCheckRemembered()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: _listener,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginBloc>();
            return AuthLayout(
              rememberMe: state.form.rememberMe,
              email: state.form.email,
              isLoading: state is LoginLoading,
              onLoginPressed: () => bloc.add(LoginSubmitted()),
              onEmailChanged: (v) => bloc.add(LoginEmailChanged(email: v)),
              onPasswordChanged: (v) =>
                  bloc.add(LoginPasswordChanged(password: v)),
              onRememberMeChanged: (v) =>
                  bloc.add(LoginRememberMeChanged(rememberMe: v)),
            );
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      Future.microtask(() {
        if (!context.mounted) return;
        ShadToaster.of(context).show(
          const ShadToast(description: Text('Sesión iniciada correctamente')),
        );
      });
    } else if (state is LoginFailure) {
      Future.microtask(() {
        if (!context.mounted) return;
        ShadToaster.of(context).show(
          ShadToast.destructive(
            alignment: Alignment.topRight,
            duration: const Duration(seconds: 8),
            closeIcon: const Icon(LucideIcons.x),
            title: const Text('Error de inicio de sesión'),
            description: Text(state.failure.message),
          ),
        );
      });
    }
  }
}
