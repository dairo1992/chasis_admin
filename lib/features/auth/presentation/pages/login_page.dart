import 'package:chasis_admin/features/auth/presentation/templates/login_form_mobile.dart';
import 'package:chasis_admin/features/auth/presentation/templates/login_form_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commons/dependency_injection/service_locator.dart';
import 'package:flutter_commons/utils/display_platform/display_platform.dart';
import 'package:chasis_admin/core/ui/atomic/templates/responsive_main_template.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => ServiceLocator.instance.get<LoginBloc>(),
      child: ResponsiveLayout(
        headerExceptions: const [DisplayPlatform.app, DisplayPlatform.web],
        footerExceptions: const [DisplayPlatform.app, DisplayPlatform.web],
        web: LoginWebTemplate(),
        mobile: LoginMobileTemplate(),
        tablet: LoginMobileTemplate(),
      ),
    );
  }
}
