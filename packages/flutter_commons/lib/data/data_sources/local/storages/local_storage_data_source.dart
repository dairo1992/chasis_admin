import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_commons/data/data_sources/local/storages/basic_local_storage_data_source.dart';
import 'package:flutter_commons/utils/interfaces/encodable.dart';

abstract class LocalStorageDataSource extends BasicLocalStorageDataSource {
  @override
  Future<void> clearAll();

  @override
  Future<void> remove(String key);

  Future<void> saveString(String key, String value, {bool isSecure = false});

  Future<void> saveBool(String key, bool value, {bool isSecure = false});

  Future<void> saveInt(String key, int value, {bool isSecure = false});

  Future<void> saveDouble(String key, double value, {bool isSecure = false});

  Future<void> saveList<T extends Encodable>(
    String key,
    List<T> value,
    T? Function(Map<String, dynamic> data) decoder, {
    bool isSecure = false,
  });

  @override
  Future<void> save<T>(String key, Encodable value);

  Future<String?> readString(String key);

  Future<bool?> readBool(String key);

  Future<int?> readInt(String key);

  Future<double?> readDouble(String key);

  Future<List<T>?> readList<T extends Encodable>(
    String key,
    T? Function(Map<String, dynamic> data) decoder,
  );

  @override
  Future<T?> read<T>(
    String key,
    T? Function(Map<String, dynamic> data) decoder,
  );

  @protected
  String encodeList<T extends Encodable>(List<T> data) {
    final encodeItems = data.map((item) => item.toJson()).toList();
    return jsonEncode(encodeItems);
  }

  @protected
  List<T>? decodeList<T>(
    dynamic data,
    T? Function(Map<String, dynamic> data) decoder,
  ) {
    if (data == null) return null;

    final Iterable list = jsonDecode(data);
    return List<T>.from(list.map((item) => decoder(jsonDecode(item))));
  }
}
