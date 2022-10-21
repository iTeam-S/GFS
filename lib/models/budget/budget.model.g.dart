// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetAdapter extends TypeAdapter<Budget> {
  @override
  final int typeId = 6;

  @override
  Budget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Budget()
      ..titre = fields[0] as String
      ..dateDebut = fields[1] as DateTime
      ..dateFin = fields[2] as DateTime
      ..montant = fields[3] as double
      ..type = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, Budget obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.titre)
      ..writeByte(1)
      ..write(obj.dateDebut)
      ..writeByte(2)
      ..write(obj.dateFin)
      ..writeByte(3)
      ..write(obj.montant)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
