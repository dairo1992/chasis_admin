import 'package:app_core/domain/entities/tokens_entity.dart';
import 'package:app_core/domain/providers/tokens_provider.dart';
import 'package:app_core/utils/enums/jwt_validation_result.dart';

final class TokenProviderImpl implements TokensProvider {
  @override
  Future<TokenEntity> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<TokenEntity> refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future<void> remove() {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> synchonize() {
    // TODO: implement synchonize
    throw UnimplementedError();
  }

  @override
  Future<JwtValidationResult> validate() {
    // TODO: implement validate
    throw UnimplementedError();
  }

  // final AuthenticationRepository authenticationRepository;
  // final Decoder<JWT> jwtDecoder;
}
