import 'package:app_core/app_core.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl with RepositoryErrorHandler implements AuthRepository {
  @override
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  }) async {
    // Mock login for now
    await Future.delayed(const Duration(seconds: 3));
    if (email == 'admin@admin.com' && password == 'admin') {
      return const Right(true);
    }
    return const Left(UnexpectedFailure(message: 'Invalid credentials'));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    return const Right(false);
  }
}
