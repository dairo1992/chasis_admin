import 'package:hive_ce/hive.dart';

part 'local_storage_model.g.dart';

@HiveType(typeId: 0)
class LocalStorageModel extends HiveObject {
  @HiveField(0)
  late String key;

  @HiveField(1)
  late String value;

  @HiveField(2)
  late bool isSecure;

  LocalStorageModel({
    required this.key,
    required this.value,
    this.isSecure = false,
  });
}
