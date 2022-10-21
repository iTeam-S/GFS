import 'package:hive_flutter/hive_flutter.dart';

part 'place.model.g.dart';

@HiveType(typeId: 7)
class Emplacement extends HiveObject {
  @HiveField(0)
  late String place;
  @HiveField(1)
  late String description;
}
