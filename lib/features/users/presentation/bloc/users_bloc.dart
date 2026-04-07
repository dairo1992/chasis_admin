import 'package:app_core/app_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chasis_admin/features/users/domain/entities/user_entity.dart';
import 'package:chasis_admin/features/users/domain/repositories/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends BaseBloc<UsersEvent, UsersState> {
  final UserRepository _userRepository;

  UsersBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UsersInitial()) {
    on<UsersLoadStarted>(_onUsersLoadStarted);
    on<UsersCreateRequested>(_onUsersCreateRequested);
    on<UsersUpdateRequested>(_onUsersUpdateRequested);
    on<UsersDeleteRequested>(_onUsersDeleteRequested);
  }

  Future<void> _onUsersLoadStarted(
    UsersLoadStarted event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoadInProgress());
    try {
      final users = await _userRepository.getUsers();
      emit(UsersLoadSuccess(users: users));
    } catch (e) {
      emit(UsersLoadFailure(message: e.toString()));
    }
  }

  Future<void> _onUsersCreateRequested(
    UsersCreateRequested event,
    Emitter<UsersState> emit,
  ) async {
    try {
      await _userRepository.createUser(event.user);
      emit(const UsersOperationSuccess(message: 'Usuario creado exitosamente'));
      add(const UsersLoadStarted());
    } catch (e) {
      emit(UsersOperationFailure(message: e.toString()));
      add(const UsersLoadStarted());
    }
  }

  Future<void> _onUsersUpdateRequested(
    UsersUpdateRequested event,
    Emitter<UsersState> emit,
  ) async {
    try {
      await _userRepository.updateUser(event.user);
      emit(const UsersOperationSuccess(message: 'Usuario actualizado exitosamente'));
      add(const UsersLoadStarted());
    } catch (e) {
      emit(UsersOperationFailure(message: e.toString()));
      add(const UsersLoadStarted());
    }
  }

  Future<void> _onUsersDeleteRequested(
    UsersDeleteRequested event,
    Emitter<UsersState> emit,
  ) async {
    try {
      await _userRepository.deleteUser(event.id);
      emit(const UsersOperationSuccess(message: 'Usuario eliminado exitosamente'));
      add(const UsersLoadStarted());
    } catch (e) {
      emit(UsersOperationFailure(message: e.toString()));
      add(const UsersLoadStarted());
    }
  }
}
