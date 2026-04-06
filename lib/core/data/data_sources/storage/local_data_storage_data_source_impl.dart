import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_commons/data/data_sources/local/storages/local_storage_data_source.dart';
import 'package:flutter_commons/utils/interfaces/encodable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:chasis_admin/core/data/models/local_storage_model.dart';

class LocalDataStorageDataSourceImpl extends LocalStorageDataSource {
  final Box<LocalStorageModel> box;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  static const _keyName = 'storage_encryption_key';
  encrypt.Encrypter? _encrypter;

  LocalDataStorageDataSourceImpl({required this.box});

  Future<encrypt.Encrypter> _getEncrypter() async {
    if (_encrypter != null) return _encrypter!;

    String? key = await _secureStorage.read(key: _keyName);
    if (key == null) {
      key = encrypt.Key.fromSecureRandom(32).base64;
      await _secureStorage.write(key: _keyName, value: key);
    }

    final encryptKey = encrypt.Key.fromBase64(key);
    _encrypter = encrypt.Encrypter(encrypt.AES(encryptKey));
    return _encrypter!;
  }

  @override
  Future<void> clearAll() async {
    await box.clear();
  }

  @override
  Future<void> remove(String key) async {
    await box.delete(key);
  }

  Future<void> _store(String key, String value, bool isSecure) async {
    String finalValue = value;
    if (isSecure) {
      final encrypter = await _getEncrypter();
      final iv = encrypt.IV.fromLength(16);
      final encrypted = encrypter.encrypt(value, iv: iv);
      finalValue = '${iv.base64}:${encrypted.base64}';
    }

    final entry = LocalStorageModel(
      key: key,
      value: finalValue,
      isSecure: isSecure,
    );

    await box.put(key, entry);
  }

  Future<String?> _retrieve(String key) async {
    final entry = box.get(key);
    if (entry == null) return null;

    if (entry.isSecure) {
      try {
        final encrypter = await _getEncrypter();
        final parts = entry.value.split(':');
        if (parts.length != 2) return null;
        
        final iv = encrypt.IV.fromBase64(parts[0]);
        final encrypted = encrypt.Encrypted.fromBase64(parts[1]);
        return encrypter.decrypt(encrypted, iv: iv);
      } catch (e) {
        return null;
      }
    }
    return entry.value;
  }

  @override
  Future<void> saveString(String key, String value, {bool isSecure = false}) =>
      _store(key, value, isSecure);

  @override
  Future<void> saveBool(String key, bool value, {bool isSecure = false}) =>
      _store(key, value.toString(), isSecure);

  @override
  Future<void> saveInt(String key, int value, {bool isSecure = false}) =>
      _store(key, value.toString(), isSecure);

  @override
  Future<void> saveDouble(String key, double value, {bool isSecure = false}) =>
      _store(key, value.toString(), isSecure);

  @override
  Future<void> saveList<T extends Encodable>(
    String key,
    List<T> value,
    T? Function(Map<String, dynamic> data) decoder, {
    bool isSecure = false,
  }) =>
      _store(key, encodeList(value), isSecure);

  @override
  Future<void> save<T>(String key, Encodable value) =>
      _store(key, value.toJson(), false);

  @override
  Future<String?> readString(String key) => _retrieve(key);

  @override
  Future<bool?> readBool(String key) async {
    final value = await _retrieve(key);
    return value == null ? null : value == 'true';
  }

  @override
  Future<int?> readInt(String key) async {
    final value = await _retrieve(key);
    return value == null ? null : int.tryParse(value);
  }

  @override
  Future<double?> readDouble(String key) async {
    final value = await _retrieve(key);
    return value == null ? null : double.tryParse(value);
  }

  @override
  Future<List<T>?> readList<T extends Encodable>(
    String key,
    T? Function(Map<String, dynamic> data) decoder,
  ) async {
    final value = await _retrieve(key);
    if (value == null) return null;
    return decodeList(value, decoder);
  }

  @override
  Future<T?> read<T>(
    String key,
    T? Function(Map<String, dynamic> data) decoder,
  ) async {
    final value = await _retrieve(key);
    if (value == null) return null;
    return decode(value, decoder);
  }
}
