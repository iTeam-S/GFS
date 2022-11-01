// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jirama.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JiramaAdapter extends TypeAdapter<Jirama> {
  @override
  final int typeId = 0;

  @override
  Jirama read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jirama()
      ..montant = fields[0] as double
      ..dateDebut = fields[1] as DateTime
      ..dateFin = fields[2] as DateTime
      ..moisDePayment = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Jirama obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.montant)
      ..writeByte(1)
      ..write(obj.dateDebut)
      ..writeByte(2)
      ..write(obj.dateFin)
      ..writeByte(3)
      ..write(obj.moisDePayment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JiramaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
