import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/database/db.transaction.dart';

import 'package:gfs/persistData/data.dart';
import 'package:line_icons/line_icons.dart';

import '../models/categorie/model.categorie.plat.dart';

class AjoutPlatPage extends StatefulWidget {
  const AjoutPlatPage({Key? key}) : super(key: key);

  @override
  State<AjoutPlatPage> createState() => _AjoutBudgPlatState();
}

class _AjoutBudgPlatState extends State<AjoutPlatPage> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _montantController = TextEditingController();
  final TextEditingController _uneCompositionController =
      TextEditingController();
  final TextEditingController _commentaireController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  final TransAction _action = TransAction();
  final DataApp _data = DataApp();
  List<PlatModel> categList = [];
  List<String> listComposant = [];

  int selectedIndex = 100;
  bool isValide = true;

  cleanAll() {
    setState(() {
      selectedIndex = 100;
    });
    _titreController.clear();
    _montantController.clear();
    _uneCompositionController.clear();
    _commentaireController.clear();
    listComposant.clear();
  }

//--------------------------

  String titre = "";
  int type = 100;

//--------------------------
  @override
  void initState() {
    categList = _data.categoriePlat;
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
            cleanAll();
          },
          icon: Icon(
            LineIcons.angleLeft,
          ),
          color: dark,
        ),
        title: Text(
          "Ajout d'un nouveau plat",
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
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "Categorie ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    color: dark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  width: Get.width * .9,
                  height: 82,
                  //color: Colors.amber,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      categWidget(
                        name: categList[0].name,
                        icon: categList[0].icon,
                        couleur: categList[0].couleur,
                        isSelected: selectedIndex == 0,
                        callback: () {
                          setState(
                            () {
                              selectedIndex = 0;
                              type = 0;
                            },
                          );

                          //print(categList[0].name);
                        },
                      ),
                      categWidget(
                        name: categList[1].name,
                        icon: categList[1].icon,
                        couleur: categList[1].couleur,
                        isSelected: selectedIndex == 1,
                        callback: () {
                          setState(
                            () {
                              selectedIndex = 1;
                              type = 1;
                            },
                          );
                          // print(categList[1].name);
                        },
                      ),
                      categWidget(
                        name: categList[2].name,
                        icon: categList[2].icon,
                        couleur: categList[2].couleur,
                        isSelected: selectedIndex == 2,
                        callback: () {
                          setState(
                            () {
                              selectedIndex = 2;
                              type = 2;
                            },
                          );

                          //print(categList[2].name);
                        },
                      ),
                    ],
                  )),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  "Nom de votre plat",
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
                    hintText: "exemple : sakafo fety, fanafody sery",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  "Montant (Ariary)",
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
                  "Les compositions du plat",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    color: dark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: Row(
                  children: [
                    Container(
                      width: Get.width * .735,
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
                        controller: _uneCompositionController,
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
                          hintText: "exemple : sakafo fety, fanafody sery",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            listComposant.add(_uneCompositionController.text);
                          });
                          _uneCompositionController.clear();
                          // print(listComposant);
                        },
                        color: selectedIndex == 100
                            ? dark
                            : categList[selectedIndex].couleur,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            LineIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: (listComposant.length <= 5)
                    ? (listComposant.length * 35).toDouble()
                    : 125,
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: selectedIndex == 100
                      ? dark
                      : categList[selectedIndex].couleur,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  itemCount: listComposant.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    final composant = listComposant[index];
                    if (listComposant.isNotEmpty) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          "+ " + composant,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          "aucune composant !",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  "Commentaire",
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
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _commentaireController,
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
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 17,
                      color: Colors.black26,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: "exemple : comment preparer ou manger le plat",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: MaterialButton(
                  onPressed: () async {
                    if (selectedIndex != 100 &&
                        _titreController.text.isNotEmpty &&
                        _montantController.text.isNotEmpty &&
                        _commentaireController.text.isNotEmpty &&
                        listComposant.isNotEmpty) {
                      await _action.addPlat(
                        compositions: listComposant,
                        prix: double.parse(_montantController.text),
                        commentaire: _commentaireController.text,
                        nom: _titreController.text,
                        categorie: _data.categoriePlat[selectedIndex].name,
                      );
                      cleanAll();
                      Get.back();
                    } else {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(
                          backgroundColor: orange,
                          content: Text(
                            selectedIndex != 100
                                ? "Assurez vous que le montant, nom du plat et la liste des ingredients ne soient pas vide!"
                                : "Veillez verifier qu'une catégorie a bien été selectioner",
                          ),
                        ),
                      );
                    }
                  },
                  color: selectedIndex == 100
                      ? dark
                      : categList[selectedIndex].couleur,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 1.5,
                      color: Colors.white,
                    ),
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

  Widget categWidget({
    required String name,
    required IconData icon,
    required Color couleur,
    required bool isSelected,
    required VoidCallback callback,
  }) {
    return InkWell(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.only(
          top: 7,
          left: 7,
          right: 7,
          bottom: 0,
        ),
        decoration: isSelected
            ? BoxDecoration(
                color: couleur.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              )
            : BoxDecoration(),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: couleur,
              radius: 25,
              child: Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
