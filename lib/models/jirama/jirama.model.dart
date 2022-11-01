import 'package:hive_flutter/hive_flutter.dart';

part 'jirama.model.g.dart';

@HiveType(typeId: 0)
class Jirama extends HiveObject {
  @HiveField(0)
  late double montant;
  @HiveField(1)
  late DateTime dateDebut;
  @HiveField(2)
  late DateTime dateFin;
  @HiveField(3)
  late String moisDePayment;
}
