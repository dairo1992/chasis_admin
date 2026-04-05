import 'package:flutter_commons/domain/entities/session_entity.dart';

abstract class SessionProvider {
  Future<void> start();
  Future<SessionEntity> getSession();
  Future<void> saveSession(SessionEntity session);
  Future<void> clearSession();
  bool get hasActiveSession;
}
