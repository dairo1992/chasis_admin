import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_core/app_core.dart';
import '../../domain/usecases/login_use_case.dart';
import 'login_event_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final LoginUseCase _loginUseCase;

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );
    debugPrint('Login result: $result');
    result.fold((failure) => emit(LoginFailure(failure)), (success) {
      if (success) {
        emit(const LoginSuccess());
      } else {
        emit(
          const LoginFailure(
            UnexpectedFailure(message: 'Credenciales inválidas'),
          ),
        );
      }
    });
  }
}
