import 'package:app_core/utils/display_platform/display_platform.dart';
import 'package:chasis_admin/core/ui/templates/app_scaffold.dart';
import 'package:chasis_admin/features/auth/presentation/templates/login_form_mobile.dart';
import 'package:chasis_admin/features/auth/presentation/templates/login_form_web.dart';
import 'package:flutter/cupertino.dart';

class AuthLayout extends StatelessWidget {
  final void Function()? onLoginPressed;
  final bool isLoading;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onRememberMeChanged;
  final bool rememberMe;
  final String email;

  const AuthLayout({
    super.key,
    required this.isLoading,
    required this.onLoginPressed,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onRememberMeChanged,
    required this.rememberMe,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      headerExclusions: const [
        DisplayPlatform.app,
        DisplayPlatform.web,
      ],
      footerExclusions: const [
        DisplayPlatform.app,
        DisplayPlatform.web,
      ],
      desktopBody: _buildWebTemplate(),
      tabletBody: _buildMobileTemplate(),
      mobileBody: _buildMobileTemplate(),
      body: _buildMobileTemplate(),
    );
  }

  Widget _buildWebTemplate() {
    return LoginWebTemplate(
      isLoading: isLoading,
      onLoginPressed: onLoginPressed,
      onEmailChanged: onEmailChanged,
      onPasswordChanged: onPasswordChanged,
      onRememberMeChanged: onRememberMeChanged,
      rememberMe: rememberMe,
      email: email,
    );
  }

  Widget _buildMobileTemplate() {
    return LoginMobileTemplate(
      isLoading: isLoading,
      onLoginPressed: onLoginPressed,
      onEmailChanged: onEmailChanged,
      onPasswordChanged: onPasswordChanged,
      onRememberMeChanged: onRememberMeChanged,
      rememberMe: rememberMe,
      email: email,
    );
  }
}
