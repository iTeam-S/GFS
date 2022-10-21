import 'package:hive_flutter/hive_flutter.dart';

import 'place.model.dart';
import '../membre/groupe.model.dart';

part 'tour_menage.model.g.dart';

@HiveType(typeId: 5)
class TourMenage extends HiveObject {
  @HiveField(0)
  late String description;
  @HiveField(1)
  late Groupe groupe;
  @HiveField(2)
  late DateTime dateHeure;
  @HiveField(3)
  late Emplacement place;
}
