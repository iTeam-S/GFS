import 'package:hive_flutter/hive_flutter.dart';

part 'membre.model.g.dart';

@HiveType(typeId: 3)
class Membre extends HiveObject {
  @HiveField(0)
  late String nom;
  @HiveField(1)
  late int promotion;
  @HiveField(2)
  late String es;
  @HiveField(3)
  late String role;
}
