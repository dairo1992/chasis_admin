import 'package:app_core/app_core.dart';
import '../repositories/auth_repository.dart';

class RememberParams extends UseCaseParams {
  const RememberParams({required this.rememberMe});
  final bool rememberMe;
}

class RememberUseCase implements UseCase<bool, RememberParams> {
  RememberUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(RememberParams params) =>
      _repository.remember(rememberMe: params.rememberMe);
}
