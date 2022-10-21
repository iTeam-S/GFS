import 'package:hive_flutter/hive_flutter.dart';

part 'compare.model.g.dart';

@HiveType(typeId: 8)
class Compare extends HiveObject {
  @HiveField(0)
  late String type;
  @HiveField(1)
  late DateTime date;
  @HiveField(2)
  late List<String> comparaisons;
  @HiveField(3)
  late List<double> montants;
}
