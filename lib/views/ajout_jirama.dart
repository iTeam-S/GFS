import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:line_icons/line_icons.dart';

import '../database/db.transaction.dart';
import 'widgets/input_date.dart';

class AjoutJirmaPage extends StatefulWidget {
  const AjoutJirmaPage({Key? key}) : super(key: key);

  @override
  State<AjoutJirmaPage> createState() => _AjoutJirmaPageState();
}

class _AjoutJirmaPageState extends State<AjoutJirmaPage> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _montantController = TextEditingController();
  final TextEditingController _dayDateDebutController = TextEditingController();
  final TextEditingController _monthDateDebutController =
      TextEditingController();
  final TextEditingController _yearDateDebutController =
      TextEditingController();
  final TextEditingController _dayDateFinController = TextEditingController();
  final TextEditingController _monthDateFinController = TextEditingController();
  final TextEditingController _yearDateFinController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  final TransAction _action = TransAction();

  bool isValide = true;

  dateValidation({
    required String jour,
    required String mois,
    required String annee,
    required bool isFirstDate,
  }) {
    int j = int.parse(jour);
    int m = int.parse(mois);
    int a = int.parse(annee);
    if (j <= 0 || j > 31 || m <= 0 || m > 12 || a <= 1999) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          backgroundColor: orange,
          dismissDirection: DismissDirection.down,
          content: Text("Votre date n'est pas valide"),
        ),
      );
      setState(() {
        isValide = false;
      });
    } else {
      setState(() {
        isValide = true;
      });
      if (isFirstDate) {
        setState(
          () {
            dateDebut = DateTime(a, m, j);
          },
        );
      } else {
        setState(
          () {
            dateFin = DateTime(a, m, j);
          },
        );
      }
    }
  }

  cleanAll() {
    _titreController.clear();
    _montantController.clear();
    _dayDateDebutController.clear();
    _monthDateDebutController.clear();
    _yearDateDebutController.clear();
    _dayDateFinController.clear();
    _monthDateFinController.clear();
    _yearDateFinController.clear();
  }

//--------------------------
  double montant = 0.0;
  String titre = "";
  int type = 100;
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();

//--------------------------
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            LineIcons.arrowLeft,
          ),
          color: dark,
        ),
        title: Text(
          "Ajout d'un payment de JIRAMA",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            color: dark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .78,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        "Mois de payement",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          color: dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _titreController,
                        onChanged: (titreValue) {
                          setState(() {
                            titre = titreValue;
                          });
                        },
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            color: Colors.black26,
                            fontWeight: FontWeight.normal,
                          ),
                          hintText: "exemple : mars,  janvier, etc",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        "Montant Eau et Electricité (Ariary) ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          color: dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _montantController,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "montant",
                          hintStyle: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            color: Colors.black26,
                            fontWeight: FontWeight.normal,
                          ),
                          suffixText: "Ariary",
                          suffixStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        "Periode de consomation du montant",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          color: dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        "Debut de la consomation",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          color: dark.withOpacity(.4),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        dataWidget(
                          controller: _dayDateDebutController,
                          width: 95,
                          hintText: "jours",
                        ),
                        dataWidget(
                          controller: _monthDateDebutController,
                          width: 80,
                          hintText: "mois",
                        ),
                        dataWidget(
                          controller: _yearDateDebutController,
                          width: 120,
                          hintText: "année",
                        ),
                      ],
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        "Fin de la consomation",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          color: dark.withOpacity(.4),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        dataWidget(
                          controller: _dayDateFinController,
                          width: 95,
                          hintText: "jours",
                        ),
                        dataWidget(
                          controller: _monthDateFinController,
                          width: 80,
                          hintText: "mois",
                        ),
                        dataWidget(
                          controller: _yearDateFinController,
                          width: 120,
                          hintText: "année",
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: MaterialButton(
                  onPressed: () async {
                    if (_titreController.text.isNotEmpty &&
                        _montantController.text.isNotEmpty) {
                      await dateValidation(
                        jour: _dayDateDebutController.text,
                        mois: _monthDateDebutController.text,
                        annee: _yearDateDebutController.text,
                        isFirstDate: true,
                      );
                      await dateValidation(
                        jour: _dayDateFinController.text,
                        mois: _monthDateFinController.text,
                        annee: _yearDateFinController.text,
                        isFirstDate: false,
                      );
                      if (isValide) {
                        await _action.addJirama(
                          montant: double.parse(_montantController.text),
                          dateDebut: dateDebut,
                          dateFin: dateFin,
                          moisDePayment: _titreController.text,
                        );
                        Get.back();
                        cleanAll();
                      }
                    } else {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(
                          backgroundColor: orange,
                          content: Text(
                            "Veillez bien verifié les formulaires ",
                          ),
                        ),
                      );
                    }
                  },
                  color: dark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "enregistrer",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
