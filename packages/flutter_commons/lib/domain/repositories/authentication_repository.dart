import 'package:flutter_commons/domain/entities/basic_token_entity.dart';
import 'package:flutter_commons/domain/entities/tokens_entity.dart';

abstract interface class AuthenticationRepository {
  Future<TokenEntity> get();

  Future<TokenEntity> refresh({required String refreshToken});

  Future<TokenEntity?> getCurrent();

  Future<void> save({required TokenEntity token});

  Future<void> remove();

  Future<void> update({required BasicTokensEntity token});
}
