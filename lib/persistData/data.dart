import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/categorie/model.categorie.dart';

class DataApp {
  List<CategorieModel> listCategorie = [
    //l'index de chaque element de cette liste correspond à la colonne "type" dans la table "budget"
    CategorieModel(
      name: "Elctricité",
      couleur: Colors.red,
      icon: LineIcons.carBattery,
    ),
    CategorieModel(
      name: "Eau",
      couleur: Colors.blue,
      icon: LineIcons.shower,
    ),
    CategorieModel(
      name: "Vetement",
      couleur: Colors.orange,
      icon: LineIcons.tShirt,
    ),
    CategorieModel(
      name: "Norriture",
      couleur: Colors.purple,
      icon: LineIcons.hamburger,
    ),
    CategorieModel(
      name: "Santé",
      couleur: Colors.green,
      icon: LineIcons.medicalBriefcase,
    ),
  ];
}
