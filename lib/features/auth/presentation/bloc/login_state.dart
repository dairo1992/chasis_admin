part of 'login_bloc.dart';

sealed class LoginState extends BaseState {
  final LoginFormUiModel form;

  LoginState({required this.form});
}

class LoginInitial extends LoginState {
  LoginInitial() : super(form: LoginFormUiModel.initial());
}

class LoginLoading extends LoginState {
  LoginLoading({required super.form});
}

class LoginSuccess extends LoginState {
  LoginSuccess({required super.form});
}

class LoginFailure extends LoginState {
  LoginFailure({required super.form, required this.failure});
  final Failure failure;
}

class LoginFormUpdated extends LoginState {
  LoginFormUpdated({required super.form});
}
