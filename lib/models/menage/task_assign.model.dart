import 'package:hive_flutter/hive_flutter.dart';

part 'task_assign.model.g.dart';

@HiveType(typeId: 8)
class TaskAssign extends HiveObject {
  @HiveField(0)
  late int groupe;
  @HiveField(1)
  late int tache;
  @HiveField(2)
  late int jour;
}
