import 'package:gfs/models/cuisine/tour_cuisine.model.dart';
import 'package:gfs/models/jirama/jirama.model.dart';
import 'package:gfs/models/membre/groupe.model.dart';
import 'package:gfs/models/membre/membre.model.dart';
import 'package:gfs/models/menage/place.model.dart';
import 'package:gfs/models/menage/tour_menage.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/budget/budget.model.dart';
import '../models/cuisine/plat.model.dart';
import '../models/menage/task_assign.model.dart';

class HiveDatabase {
  //ouvre les tables dans la base de donnée pour que l'application puisse effectuer des transaction
  Future openTableBox() async {
    await Hive.openBox<Budget>('budget');
    await Hive.openBox<Plat>('plat');
    await Hive.openBox<TourCuisine>('tcuisine');
    await Hive.openBox<Emplacement>('place');
    await Hive.openBox<TourMenage>('tmenage');
    await Hive.openBox<Membre>('membre');
    await Hive.openBox<Groupe>('groupe');
    await Hive.openBox<Jirama>('jirama');
    await Hive.openBox<TaskAssign>('task');
    //await Hive.openBox<Compare>('comparaison');
  }

//enregistre les adaptateur de chaque table pour que les données de l'application interagit avec celui de la BD
//les "Adapter" permet d'utiliser directement des types de donnée que normalement la BD n'autorise pas ou prend beaucoup de temps à convertir manuellment
  registreAdapter() {
    Hive.registerAdapter(BudgetAdapter());
    Hive.registerAdapter(PlatAdapter());
    Hive.registerAdapter(TourCuisineAdapter());
    Hive.registerAdapter(EmplacementAdapter());
    Hive.registerAdapter(TourMenageAdapter());
    Hive.registerAdapter(TaskAssignAdapter());
    Hive.registerAdapter(MembreAdapter());
    Hive.registerAdapter(GroupeAdapter());
    Hive.registerAdapter(JiramaAdapter());
  }
}

class Boxes {
  //associe la table NoSQL et les HiveObject ou model de donnée qu'on a crée
  static Box<Budget> getBudget() => Hive.box<Budget>('budget');
  static Box<Plat> getPlat() => Hive.box<Plat>('plat');
  static Box<TourCuisine> getTourCuisine() => Hive.box<TourCuisine>('tcuisine');
  static Box<Emplacement> getEmplacement() => Hive.box<Emplacement>('place');
  static Box<TourMenage> getTourMenage() => Hive.box<TourMenage>('tmenage');
  static Box<Membre> getMembre() => Hive.box<Membre>('membre');
  static Box<Groupe> getGroupe() => Hive.box<Groupe>('groupe');
  static Box<Jirama> getJirama() => Hive.box<Jirama>('jirama');
  static Box<TaskAssign> getTask() => Hive.box<TaskAssign>('task');
}
