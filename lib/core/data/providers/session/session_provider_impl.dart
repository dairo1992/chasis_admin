import 'package:app_core/domain/entities/session_entity.dart';
import 'package:app_core/domain/providers/session_provider.dart';

class SessionProviderImpl implements SessionProvider {
  SessionEntity? _session;

  @override
  Future<void> start() async {
    _session = null;
  }

  @override
  Future<void> clearSession() async {
    _session = null;
  }

  @override
  Future<SessionEntity> getSession() async {
    if (_session == null) {
      throw Exception('Session not found');
    }
    return _session!;
  }

  @override
  Future<void> saveSession(SessionEntity session) async {
    _session = session;
  }

  @override
  bool get hasActiveSession => _session != null ? true : false;
}
