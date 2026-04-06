import 'package:chasis_admin/features/auth/domain/usecases/get_remember_use_case.dart';
import 'package:chasis_admin/features/auth/domain/usecases/remember_use_case.dart';
import 'package:chasis_admin/features/auth/presentation/models/login_form_ui_model.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_core/app_core.dart';
import '../../domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginUseCase loginUseCase,
    required GetRememberMeUseCase getRememberMeUseCase,
    required RememberUseCase rememberUseCase,
  })  : _loginUseCase = loginUseCase,
        _getRememberMeUseCase = getRememberMeUseCase,
        _rememberUseCase = rememberUseCase,
        super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginRememberMeChanged>(_onLoginRememberMeChanged);
    on<LoginCheckRemembered>(_onLoginCheckRemembered);
  }

  LoginFormUiModel get form => state.form;

  final LoginUseCase _loginUseCase;
  final GetRememberMeUseCase _getRememberMeUseCase;
  final RememberUseCase _rememberUseCase;

  Future<void> _onLoginCheckRemembered(
    LoginCheckRemembered event,
    Emitter<LoginState> emit,
  ) async {
    final result = await _getRememberMeUseCase(const NoParams());
    result.fold(
      (failure) => null,
      (email) {
        if (email.isNotEmpty) {
          emit(LoginFormUpdated(form: form.copyWith(email: email, rememberMe: true)));
        }
      },
    );
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading(form: form));

    final result = await _loginUseCase(
      LoginParams(email: form.email, password: form.password),
    );
    debugPrint('Login result: $result');
    await result.fold(
      (failure) async => emit(LoginFailure(form: form, failure: failure)),
      (success) async {
        if (success) {
          // Handle remember me logic
          final emailToSave = form.rememberMe ? form.email : '';
          await _rememberUseCase(RememberParams(rememberMe: emailToSave));

          emit(LoginSuccess(form: form));
        } else {
          emit(
            LoginFailure(
              form: form,
              failure: const UnexpectedFailure(message: 'Credenciales inválidas'),
            ),
          );
        }
      },
    );
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
