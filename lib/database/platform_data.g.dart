// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlatformDataAdapter extends TypeAdapter<PlatformData> {
  @override
  final int typeId = 6;

  @override
  PlatformData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlatformData(
      platforms: (fields[0] as List).cast<PlatformsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlatformData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.platforms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
