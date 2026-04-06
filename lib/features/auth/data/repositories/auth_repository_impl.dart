import 'package:app_core/app_core.dart';
import 'package:flutter_commons/data/data_sources/local/storages/local_storage_data_source.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl with RepositoryErrorHandler implements AuthRepository {
  final LocalStorageDataSource _localStorageDataSource;

  AuthRepositoryImpl({required LocalStorageDataSource localStorageDataSource})
      : _localStorageDataSource = localStorageDataSource;

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

  @override
  Future<Either<Failure, String>> remember({required String rememberMe}) async {
    await _localStorageDataSource.saveString('remember_me', rememberMe);
    return Right(rememberMe);
  }

  @override
  Future<Either<Failure, String>> getRememberMe() async {
    final rememberMe = await _localStorageDataSource.readString('remember_me');
    return Right(rememberMe ?? '');
  }
}
