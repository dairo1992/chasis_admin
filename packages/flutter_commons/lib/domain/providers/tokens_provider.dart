import 'package:flutter_commons/domain/entities/tokens_entity.dart';
import 'package:flutter_commons/utils/enums/jwt_validation_result.dart';

abstract class TokensProvider {
  Future<void> synchonize();

  Future<TokenEntity> get();

  Future<TokenEntity> refresh();

  Future<JwtValidationResult> validate();

  Future<void> remove();
}
