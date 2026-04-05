import 'package:chasis_admin/core/ui/atomic/templates/responsive_main_template.dart';
import 'package:chasis_admin/features/auth/presentation/templates/login_form_mobile.dart';
import 'package:chasis_admin/features/auth/presentation/templates/login_form_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_commons/utils/display_platform/display_platform.dart';

class AuthLayout extends StatelessWidget {
  final void Function()? onLoginPressed;
  final bool isLoading;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onRememberMeChanged;
  final bool rememberMe;

  const AuthLayout({
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
    return ResponsiveLayout(
      headerExceptions: const [DisplayPlatform.app, DisplayPlatform.web],
      footerExceptions: const [DisplayPlatform.app, DisplayPlatform.web],
      web: LoginWebTemplate(
        isLoading: isLoading,
        onLoginPressed: onLoginPressed,
        onEmailChanged: onEmailChanged,
        onPasswordChanged: onPasswordChanged,
        onRememberMeChanged: onRememberMeChanged,
        rememberMe: rememberMe,
      ),
      mobile: LoginMobileTemplate(
        isLoading: isLoading,
        onLoginPressed: onLoginPressed,
        onEmailChanged: onEmailChanged,
        onPasswordChanged: onPasswordChanged,
        onRememberMeChanged: onRememberMeChanged,
        rememberMe: rememberMe,
      ),
      tablet: LoginMobileTemplate(
        isLoading: isLoading,
        onLoginPressed: onLoginPressed,
        onEmailChanged: onEmailChanged,
        onPasswordChanged: onPasswordChanged,
        onRememberMeChanged: onRememberMeChanged,
        rememberMe: rememberMe,
      ),
    );
  }
}
