import 'package:hive_flutter/hive_flutter.dart';

part 'budget.model.g.dart';

@HiveType(typeId: 6)
class Budget extends HiveObject {
  @HiveField(0)
  late String titre;
  @HiveField(1)
  late DateTime dateDebut;
  @HiveField(2)
  late DateTime dateFin;
  @HiveField(3)
  late double montant;
  @HiveField(4)
  late int type;
}
