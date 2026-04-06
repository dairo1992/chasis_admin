import 'package:app_core/app_core.dart';
import '../repositories/auth_repository.dart';

class GetRememberMeUseCase implements UseCase<String, NoParams> {
  final AuthRepository repository;

  GetRememberMeUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) =>
      repository.getRememberMe();
}
