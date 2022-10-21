// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_cuisine.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TourCuisineAdapter extends TypeAdapter<TourCuisine> {
  @override
  final int typeId = 2;

  @override
  TourCuisine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TourCuisine()
      ..plat = fields[0] as Plat
      ..groupe = fields[1] as Groupe
      ..dateHeure = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, TourCuisine obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.plat)
      ..writeByte(1)
      ..write(obj.groupe)
      ..writeByte(2)
      ..write(obj.dateHeure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TourCuisineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
