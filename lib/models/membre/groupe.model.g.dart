// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupe.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupeAdapter extends TypeAdapter<Groupe> {
  @override
  final int typeId = 4;

  @override
  Groupe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Groupe()
      ..gp = (fields[0] as List).cast<Membre>()
      ..nom = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Groupe obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gp)
      ..writeByte(1)
      ..write(obj.nom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
