// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmplacementAdapter extends TypeAdapter<Emplacement> {
  @override
  final int typeId = 7;

  @override
  Emplacement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emplacement()
      ..place = fields[0] as String
      ..description = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Emplacement obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.place)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmplacementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
