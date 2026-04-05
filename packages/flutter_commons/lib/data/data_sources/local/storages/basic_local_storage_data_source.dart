import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_commons/utils/interfaces/encodable.dart';

abstract class BasicLocalStorageDataSource {
  Future<void> clearAll();

  Future<void> remove(String key);

  Future<void> save<T>(String key, Encodable value);

  Future<T?> read<T>(
    String key,
    T? Function(Map<String, dynamic> data) decoder,
  );

  @protected
  T? decode<T>(String? data, T? Function(Map<String, dynamic> data) decoder) {
    if (data == null) return null;
    final jsonData = json.decode(data) as Map<String, dynamic>;
    return decoder(jsonData);
  }
}
