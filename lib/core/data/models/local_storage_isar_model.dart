import 'package:isar/isar.dart';

part 'local_storage_isar_model.g.dart';

@collection
class LocalStorageIsarModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String key;

  late String value;

  late bool isSecure;
}
