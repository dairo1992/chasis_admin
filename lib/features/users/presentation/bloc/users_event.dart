part of 'users_bloc.dart';

sealed class UsersEvent extends BaseEvent {
  const UsersEvent();
}

class UsersLoadStarted extends UsersEvent {
  const UsersLoadStarted();
}

class UsersCreateRequested extends UsersEvent {
  final UserEntity user;
  const UsersCreateRequested({required this.user});
}

class UsersUpdateRequested extends UsersEvent {
  final UserEntity user;
  const UsersUpdateRequested({required this.user});
}

class UsersDeleteRequested extends UsersEvent {
  final String id;
  const UsersDeleteRequested({required this.id});
}
