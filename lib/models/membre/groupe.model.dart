import 'package:hive_flutter/hive_flutter.dart';

import 'membre.model.dart';

part 'groupe.model.g.dart';

@HiveType(typeId: 4)
class Groupe extends HiveObject {
  @HiveField(0)
  late List<Membre> gp;
  @HiveField(1)
  late String nom;
}
