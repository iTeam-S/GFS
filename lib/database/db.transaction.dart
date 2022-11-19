import '../models/budget/budget.model.dart';
import '../models/cuisine/plat.model.dart';
import '../models/cuisine/tour_cuisine.model.dart';
import '../models/jirama/jirama.model.dart';
import '../models/membre/groupe.model.dart';
import '../models/membre/membre.model.dart';
import '../models/menage/place.model.dart';
import '../models/menage/task_assign.model.dart';
import '../models/menage/tour_menage.model.dart';
import 'db.service.dart';

class TransAction {
  //supprime un element d'une table choisie en fonction de son index dans la liste
  Future<void> deleteItemAt({
    required String boxe,
    required int itemId,
  }) async {
    switch (boxe) {
      case 'jirama':
        await Boxes.getJirama().deleteAt(itemId);
        break;
      case 'jirama-all':
        await Boxes.getJirama().deleteAt(itemId);
        break;
      case 'plat':
        await Boxes.getPlat().deleteAt(itemId);
        break;
      case 'tour_cuisine':
        await Boxes.getTourCuisine().deleteAt(itemId);
        break;
      case 'place':
        await Boxes.getEmplacement().deleteAt(itemId);
        break;
      case 'tour_menage':
        await Boxes.getTourMenage().deleteAt(itemId);
        break;
      case 'budget':
        await Boxes.getBudget().deleteAt(itemId);
        break;
      case 'membre':
        await Boxes.getMembre().deleteAt(itemId);
        break;
      case 'groupe':
        await Boxes.getGroupe().deleteAt(itemId);
        break;

      default:
        print("unknown boxe");
    }
  }

//===============================================================================================
//modifie les elements de la colonne JIRAMA en fonction de son index dans la liste
  Future<void> editJirama({
    required int index,
    required double montant,
    required DateTime dateDebut,
    required DateTime dateFin,
    required String moisDePayment,
  }) async {
    Jirama jirama = Jirama();
    jirama.montant = montant;
    jirama.dateDebut = dateDebut;
    jirama.dateFin = dateFin;
    jirama.moisDePayment = moisDePayment;

    final box = Boxes.getJirama();

    await box.putAt(
      index,
      Jirama()
        ..montant = jirama.montant
        ..dateDebut = jirama.dateDebut
        ..dateFin = jirama.dateFin
        ..moisDePayment = jirama.moisDePayment,
    );
    print("modifiation JIRAMA ok");
  }

  //modifie les elements de la colonne BUDGET en fonction de son index dans la liste
  Future<void> editBudget({
    required int index,
    required double montant,
    required DateTime dateDebut,
    required DateTime dateFin,
    required int type,
    required String titre,
  }) async {
    Budget budget = Budget();
    budget.montant = montant;
    budget.dateDebut = dateDebut;
    budget.dateFin = dateFin;
    budget.titre = titre;
    budget.type = type;

    final box = Boxes.getBudget();

    await box.putAt(
      index,
      Budget()
        ..montant = budget.montant
        ..dateDebut = budget.dateDebut
        ..dateFin = budget.dateFin
        ..titre = budget.titre
        ..type = budget.type,
    );
    print("modifiation BUDGET ok");
  }

  //modifie les elements de la colonne BUDGET en fonction de son index dans la liste
  Future<void> editPlat({
    required int index,
    required double prix,
    required String commentaire,
    required String nom,
    required String categorie,
  }) async {
    Plat budget = Plat();
    budget.prix = prix;
    budget.nom = nom;
    budget.commentaire = commentaire;
    budget.categorie = categorie;

    final box = Boxes.getPlat();

    await box.putAt(
      index,
      Plat()
        ..prix = budget.prix
        ..nom = budget.nom
        ..categorie = budget.categorie
        ..commentaire = budget.commentaire,
    );
    print("modifiation PLAT ok");
  }

  //modifie les elements de la colonne TOUR CUISINE en fonction de son index dans la liste
  Future<void> editTourCuisine({
    required int index,
    required Plat plat,
    required Groupe groupe,
    required DateTime dateHeure,
  }) async {
    TourCuisine tourCuisine = TourCuisine();
    tourCuisine.plat = plat;
    tourCuisine.groupe = groupe;
    tourCuisine.dateHeure = dateHeure;

    final box = Boxes.getTourCuisine();

    await box.putAt(
      index,
      TourCuisine()
        ..plat = tourCuisine.plat
        ..groupe = tourCuisine.groupe
        ..dateHeure = tourCuisine.dateHeure,
    );
    print("modifiation PLAT ok");
  }

  //modifie les elements de la colonne TOUR GROUPE en fonction de son index dans la liste
  Future<void> editGroupe({
    required int index,
    required List<Membre> gp,
    required String nom,
  }) async {
    Groupe groupe = Groupe();
    groupe.gp = gp;
    groupe.nom = nom;

    final box = Boxes.getGroupe();

    await box.putAt(
      index,
      Groupe()
        ..gp = groupe.gp
        ..nom = groupe.nom,
    );
    print("modifiation GROUPE ok");
  }

  //modifie les elements de la colonne MEMBRES en fonction de son index dans la liste
  Future<void> editMembre({
    required int index,
    required String nom,
    required int promotion,
    required String es,
    required String role,
  }) async {
    Membre membre = Membre();
    membre.nom = nom;
    membre.promotion = promotion;
    membre.es = es;
    membre.role = role;

    final box = Boxes.getMembre();

    await box.putAt(
      index,
      Membre()
        ..nom = membre.nom
        ..promotion = membre.promotion
        ..role = membre.role
        ..es = membre.es,
    );
    print("modifiation MEMBRE ok");
  }

  //modifie les elements de la colonne PLACES en fonction de son index dans la liste
  Future<void> editEmplacement({
    required int index,
    required String place,
    required String description,
  }) async {
    Emplacement emplacement = Emplacement();
    emplacement.place = place;
    emplacement.description = description;

    final box = Boxes.getEmplacement();

    await box.putAt(
      index,
      Emplacement()
        ..place = emplacement.place
        ..description = emplacement.description,
    );
    print("modifiation PLACE ok");
  }

  //modifie les elements de la colonne TOUR MENAGE en fonction de son index dans la liste
  Future<void> editTourMenage({
    required int index,
    required List<TaskAssign> description,
  }) async {
    TourMenage tourMenage = TourMenage();
    tourMenage.description = description.cast<TaskAssign>();

    final box = Boxes.getTourMenage();

    await box.putAt(
      index,
      TourMenage()..description = tourMenage.description,
    );
    print("modifiation TOUR MENAGE ok");
  }

//=====================================================================================================
  Future addJirama({
    required double montant,
    required DateTime dateDebut,
    required DateTime dateFin,
    required String moisDePayment,
  }) async {
    final jirama = Jirama()
      ..montant = montant
      ..dateDebut = dateDebut
      ..dateFin = dateFin
      ..moisDePayment = moisDePayment;
    final box = Boxes.getJirama();
    await box.add(jirama);
    print("ajout jirama :  $montant");
  }

  Future addBudget({
    required double montant,
    required DateTime dateDebut,
    required DateTime dateFin,
    required int type,
    required String titre,
  }) async {
    final budget = Budget()
      ..montant = montant
      ..dateDebut = dateDebut
      ..dateFin = dateFin
      ..titre = titre
      ..type = type;
    final box = Boxes.getBudget();
    await box.add(budget);
    print("ajout budget :  $titre");
  }

  Future addPlat({
    required double prix,
    required String commentaire,
    required String nom,
    required String categorie,
    required List<String> compositions,
  }) async {
    final plat = Plat()
      ..prix = prix
      ..commentaire = commentaire
      ..nom = nom
      ..compositions = compositions
      ..categorie = categorie;
    final box = Boxes.getPlat();
    await box.add(plat);
    print("ajout plat :  $nom");
  }

  Future addTourCuisine({
    required Plat plat,
    required Groupe groupe,
    required DateTime dateHeure,
  }) async {
    final tourCuisine = TourCuisine()
      ..plat = plat
      ..groupe = groupe
      ..dateHeure = dateHeure;
    final box = Boxes.getTourCuisine();
    await box.add(tourCuisine);
    print("ajout tour de cuisine :  $plat");
  }

  Future addGroupe({
    required List<Membre> gp,
    required String nom,
  }) async {
    final groupe = Groupe()
      ..gp = gp
      ..nom = nom;
    final box = Boxes.getGroupe();
    await box.add(groupe);
    print("ajout groupe :  $nom");
  }

  Future addMembre({
    required String nom,
    required int promotion,
    required String es,
    required String role,
  }) async {
    final membre = Membre()
      ..nom = nom
      ..promotion = promotion
      ..es = es
      ..role = role;
    final box = Boxes.getMembre();
    await box.add(membre);
    print("ajout membre :  $nom");
  }

  Future addEmplacement({
    required String place,
    required String description,
  }) async {
    final emplacement = Emplacement()
      ..place = place
      ..description = description;

    final box = Boxes.getEmplacement();
    await box.add(emplacement);
    print("ajout emplacement :  $place");
  }

  Future addTourMenage({
    required List<TaskAssign> description,
  }) async {
    final tourMenage = TourMenage()..description = description;
    final box = Boxes.getTourMenage();
    await box.add(tourMenage);
    print("ajout tour de menage :  & ${description[0].groupe}");
  }
}
