import 'dart:convert';

import 'package:flutter_commons/utils/extensions/map_extension.dart';
import 'package:flutter_commons/utils/interfaces/encodable.dart';
import 'package:flutter_commons/utils/strings.dart';

class SessionEntity implements Encodable {
  factory SessionEntity.fromJson(String json) =>
      SessionEntity.fromMap(jsonDecode(json));

  factory SessionEntity.fromMap(Map<String, dynamic> map) {
    return SessionEntity(
      sessionId: map.getOrNull(_sessionIdKey) ?? Strings.I.empty,
      userId: map.getOrNull(_userIdKey) ?? Strings.I.empty,
      accessToken: map.getOrNull(_accessTokenKey) ?? Strings.I.empty,
      refreshToken: map.getOrNull(_refreshTokenKey) ?? Strings.I.empty,
      createdAt: DateTime.parse(
        map.getOrNull(_createdAtKey) ?? DateTime.now().toIso8601String(),
      ),
      expiresAt: DateTime.parse(
        map.getOrNull(_expiresAtKey) ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  final String sessionId;
  final String userId;
  final String accessToken;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime expiresAt;

  SessionEntity({
    required this.sessionId,
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.createdAt,
    required this.expiresAt,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      _sessionIdKey: sessionId,
      _userIdKey: userId,
      _accessTokenKey: accessToken,
      _refreshTokenKey: refreshToken,
      _createdAtKey: createdAt.toIso8601String(),
      _expiresAtKey: expiresAt.toIso8601String(),
    };
  }

  @override
  String toJson() => json.encode(toMap());

  SessionEntity copyWith({
    String? sessionId,
    String? userId,
    String? accessToken,
    String? refreshToken,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return SessionEntity(
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  static const String _sessionIdKey = 'sessionId';
  static const String _userIdKey = 'userId';
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _createdAtKey = 'createdAt';
  static const String _expiresAtKey = 'expiresAt';
}
