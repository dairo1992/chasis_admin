import 'package:flutter_commons/domain/session_provider.dart';

final class DependenciesSetupManager {
  final SessionProvider sessionProvider;

  DependenciesSetupManager({required this.sessionProvider});

  Future<void> start() async {
    await sessionProvider.start();
  }
}
