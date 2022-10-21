// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membre.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MembreAdapter extends TypeAdapter<Membre> {
  @override
  final int typeId = 3;

  @override
  Membre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Membre()
      ..nom = fields[0] as String
      ..promotion = fields[1] as int
      ..es = fields[2] as String
      ..role = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Membre obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.promotion)
      ..writeByte(2)
      ..write(obj.es)
      ..writeByte(3)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MembreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
