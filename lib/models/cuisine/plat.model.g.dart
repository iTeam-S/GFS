// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plat.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlatAdapter extends TypeAdapter<Plat> {
  @override
  final int typeId = 1;

  @override
  Plat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plat()
      ..categorie = fields[0] as String
      ..nom = fields[1] as String
      ..commentaire = fields[2] as String
      ..prix = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, Plat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.categorie)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.commentaire)
      ..writeByte(3)
      ..write(obj.prix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
