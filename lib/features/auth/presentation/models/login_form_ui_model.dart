import 'package:app_core/domain/value_objects/email_value_object.dart';
import 'package:app_core/domain/value_objects/password_value_object.dart';

class LoginFormUiModel {
  final EmailValueObject email;
  final PasswordValueObject password;
  final bool rememberMe;

  LoginFormUiModel({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  factory LoginFormUiModel.initial() => LoginFormUiModel(
      email: EmailValueObject(input: ''),
      password: PasswordValueObject(value: ''),
      rememberMe: false);

  // @override
  // bool get isValid => email.isValid() && password.isValid();

  // String? get passwordError {
  //   return getErrorMessage(
  //     valueObject: password,
  //     alphabetSequenceErrorMessage: '',
  //     notAlphanumericErrorMessage: '',
  //     notInRangeErrorMessage: '',
  //   );
  // }

  LoginFormUiModel copyWith({
    EmailValueObject? email,
    PasswordValueObject? password,
    bool? rememberMe,
    bool? isLoading,
  }) =>
      LoginFormUiModel(
        email: email ?? this.email,
        password: password ?? this.password,
        rememberMe: rememberMe ?? this.rememberMe,
      );
}
