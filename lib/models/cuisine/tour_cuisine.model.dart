import 'package:hive_flutter/hive_flutter.dart';

import '../membre/groupe.model.dart';
import 'plat.model.dart';

part 'tour_cuisine.model.g.dart';

@HiveType(typeId: 2)
class TourCuisine extends HiveObject {
  @HiveField(0)
  late Plat plat;
  @HiveField(1)
  late Groupe groupe;
  @HiveField(2)
  late DateTime dateHeure;
}
