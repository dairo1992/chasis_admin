import 'package:app_core/app_core.dart';
import '../repositories/auth_repository.dart';

class LoginParams extends UseCaseParams {
  const LoginParams({required this.email, required this.password});
  final String email;
  final String password;
}

class LoginUseCase implements UseCase<bool, LoginParams> {
  LoginUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(LoginParams params) =>
      _repository.login(email: params.email, password: params.password);
}
