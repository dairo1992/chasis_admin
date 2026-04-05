import 'package:app_core/app_core.dart';

sealed class LoginEvent extends BaseEvent {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({required this.email, required this.password});
  final String email;
  final String password;
}

sealed class LoginState extends BaseState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginFailure extends LoginState {
  const LoginFailure(this.failure);
  final Failure failure;
}
