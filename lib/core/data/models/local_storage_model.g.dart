// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStorageModelAdapter extends TypeAdapter<LocalStorageModel> {
  @override
  final typeId = 0;

  @override
  LocalStorageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStorageModel(
      key: fields[0] as String,
      value: fields[1] as String,
      isSecure: fields[2] == null ? false : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalStorageModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.isSecure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStorageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
