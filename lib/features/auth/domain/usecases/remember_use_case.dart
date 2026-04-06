import 'package:app_core/app_core.dart';
import '../repositories/auth_repository.dart';

class RememberParams extends UseCaseParams {
  const RememberParams({required this.rememberMe});
  final String rememberMe;
}

class RememberUseCase implements UseCase<String, RememberParams> {
  RememberUseCase({required this.repository});
  final AuthRepository repository;

  @override
  Future<Either<Failure, String>> call(RememberParams params) =>
      repository.remember(rememberMe: params.rememberMe);
}
