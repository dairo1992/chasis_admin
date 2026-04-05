import 'dart:convert';
import 'package:flutter_commons/domain/entities/basic_token_entity.dart';
import 'package:flutter_commons/utils/extensions/map_extension.dart';
import 'package:flutter_commons/utils/interfaces/encodable.dart';
import 'package:flutter_commons/utils/strings.dart';

final class TokenEntity implements Encodable, BasicTokensEntity {
  factory TokenEntity.fromMap(Map<String, dynamic> map) {
    return TokenEntity(
      expiresIn: map.getOrNull(_expiresInKey) ?? 0,
      expiresAt: map.getOrNull(_expiresAtKey) ?? 0,
      tokenType: map.getOrNull(_tokenTypeKey) ?? Strings.I.empty,
      accessToken: map.getOrNull(_accessTokenKey) ?? Strings.I.empty,
      refreshToken: map.getOrNull(_refreshTokenKey) ?? Strings.I.empty,
    );
  }

  TokenEntity({
    required this.expiresIn,
    required this.expiresAt,
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
  });

  final int expiresIn;
  final int expiresAt;
  final String tokenType;

  @override
  final String accessToken;

  @override
  final String refreshToken;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      _expiresInKey: expiresIn,
      _expiresAtKey: expiresAt,
      _tokenTypeKey: tokenType,
      _accessTokenKey: accessToken,
      _refreshTokenKey: refreshToken,
    };
  }

  TokenEntity copyWith({
    int? expiresIn,
    int? expiresAt,
    String? tokenType,
    String? accessToken,
    String? refreshToken,
  }) {
    return TokenEntity(
      expiresIn: expiresIn ?? this.expiresIn,
      expiresAt: expiresAt ?? this.expiresAt,
      tokenType: tokenType ?? this.tokenType,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  //Coding Keys
  static const String _expiresInKey = 'expires_in';
  static const String _expiresAtKey = 'expires_at';
  static const String _tokenTypeKey = 'token_type';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
}
