part of 'login_bloc.dart';

sealed class LoginEvent extends BaseEvent {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged({required this.email});
  final String email;
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged({required this.password});
  final String password;
}

class LoginRememberMeChanged extends LoginEvent {
  const LoginRememberMeChanged({required this.rememberMe});
  final bool rememberMe;
}
