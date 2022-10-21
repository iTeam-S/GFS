// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompareAdapter extends TypeAdapter<Compare> {
  @override
  final int typeId = 8;

  @override
  Compare read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Compare()
      ..type = fields[0] as String
      ..date = fields[1] as DateTime
      ..comparaisons = (fields[2] as List).cast<String>()
      ..montants = (fields[3] as List).cast<double>();
  }

  @override
  void write(BinaryWriter writer, Compare obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.comparaisons)
      ..writeByte(3)
      ..write(obj.montants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompareAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
