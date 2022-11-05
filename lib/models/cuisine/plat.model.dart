import 'package:hive_flutter/hive_flutter.dart';

part 'plat.model.g.dart';

@HiveType(typeId: 1)
class Plat extends HiveObject {
  @HiveField(0)
  late String categorie;
  @HiveField(1)
  late String nom;
  @HiveField(2)
  late String commentaire;
  @HiveField(3)
  late double prix;
  @HiveField(4)
  late List<String> compositions;
}
