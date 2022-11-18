import 'package:flutter/material.dart';
import 'package:gfs/models/categorie/model.categorie.plat.dart';
import 'package:line_icons/line_icons.dart';

import '../models/categorie/model.categorie.budget.dart';

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
    CategorieModel(
      name: "Transport",
      couleur: Colors.grey,
      icon: LineIcons.car,
    )
  ];

  List<String> mois = [
    'zero',
    'Janv',
    'Fevr',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Sep',
    'Oct',
    'Nov',
    'Déc',
  ];

  List<PlatModel> categoriePlat = [
    PlatModel(
      name: "Petit dej",
      couleur: Colors.blueAccent,
      icon: LineIcons.cheese,
    ),
    PlatModel(
      name: "Resistance",
      couleur: Colors.amber,
      icon: LineIcons.drumstickWithBiteTakenOut,
    ),
    PlatModel(
      name: "Dessert",
      couleur: Colors.pink,
      icon: LineIcons.birthdayCake,
    ),
  ];
  List<Color> couleurTache = [
    Colors.black,
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.redAccent,
    Colors.teal,
    Colors.indigo,
    Colors.deepOrange,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.lime,
    Colors.cyan,
  ];
}
