import 'package:chasis_admin/features/auth/presentation/models/login_form_ui_model.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_core/app_core.dart';
import '../../domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginRememberMeChanged>(_onLoginRememberMeChanged);
  }

  LoginFormUiModel get form => state.form;

  final LoginUseCase _loginUseCase;

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading(form: form));

    final result = await _loginUseCase(
      LoginParams(email: form.email, password: form.password),
    );
    debugPrint('Login result: $result');
    result.fold((failure) => emit(LoginFailure(form: form, failure: failure)), (
      success,
    ) {
      if (success) {
        emit(LoginSuccess(form: form));
      } else {
        emit(
          LoginFailure(
            form: form,
            failure: UnexpectedFailure(message: 'Credenciales inválidas'),
          ),
        );
      }
    });
  }

  Future<void> _onLoginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginFormUpdated(form: form.copyWith(email: event.email)));
  }

  Future<void> _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginFormUpdated(form: form.copyWith(password: event.password)));
  }

  Future<void> _onLoginRememberMeChanged(
    LoginRememberMeChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginFormUpdated(form: form.copyWith(rememberMe: event.rememberMe)));
  }
}
