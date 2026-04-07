part of 'users_bloc.dart';

sealed class UsersState extends BaseState {
  const UsersState();
}

class UsersInitial extends UsersState {}

class UsersLoadInProgress extends UsersState {}

class UsersLoadSuccess extends UsersState {
  final List<UserEntity> users;
  const UsersLoadSuccess({required this.users});
}

class UsersLoadFailure extends UsersState {
  final String message;
  const UsersLoadFailure({required this.message});
}

class UsersOperationSuccess extends UsersState {
  final String message;
  const UsersOperationSuccess({required this.message});
}

class UsersOperationFailure extends UsersState {
  final String message;
  const UsersOperationFailure({required this.message});
}
