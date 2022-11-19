import 'package:hive_flutter/hive_flutter.dart';

import 'task_assign.model.dart';

part 'tour_menage.model.g.dart';

@HiveType(typeId: 5)
class TourMenage extends HiveObject {
  @HiveField(0)
  late List<TaskAssign> description;
}
