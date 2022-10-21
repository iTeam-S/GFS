// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_menage.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TourMenageAdapter extends TypeAdapter<TourMenage> {
  @override
  final int typeId = 5;

  @override
  TourMenage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TourMenage()
      ..description = fields[0] as String
      ..groupe = fields[1] as Groupe
      ..dateHeure = fields[2] as DateTime
      ..place = fields[3] as Emplacement;
  }

  @override
  void write(BinaryWriter writer, TourMenage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.groupe)
      ..writeByte(2)
      ..write(obj.dateHeure)
      ..writeByte(3)
      ..write(obj.place);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TourMenageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
