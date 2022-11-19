// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_assign.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAssignAdapter extends TypeAdapter<TaskAssign> {
  @override
  final int typeId = 8;

  @override
  TaskAssign read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskAssign()
      ..groupe = fields[0] as int
      ..tache = fields[1] as int
      ..jour = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, TaskAssign obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.groupe)
      ..writeByte(1)
      ..write(obj.tache)
      ..writeByte(2)
      ..write(obj.jour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAssignAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
