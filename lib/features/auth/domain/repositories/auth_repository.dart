import 'package:app_core/app_core.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, bool>> isAuthenticated();

  Future<Either<Failure, String>> remember({required String rememberMe});

  Future<Either<Failure, String>> getRememberMe();
}
