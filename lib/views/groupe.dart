import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gfs/models/membre/groupe.model.dart';
import 'package:gfs/models/membre/membre.model.dart';
import 'package:gfs/views/widgets/snack_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';
import '../database/db.service.dart';
import '../database/db.transaction.dart';
import 'widgets/empty.dart';

class GroupePage extends StatefulWidget {
  const GroupePage({Key? key}) : super(key: key);

  @override
  State<GroupePage> createState() => _GroupePageState();
}

class _GroupePageState extends State<GroupePage> {
  final TextEditingController _groupeNameController = TextEditingController();
  final TransAction _action = TransAction();
  late ScaffoldMessengerState scaffoldMessenger;
  // List<Membre> listOfMembre2 = Boxes.getMembre().values.toList().cast<Membre>();

  List<Membre> membreDuGroupe = [];
  List<Membre> ttay = [];
  var listenableGroupe = Boxes.getGroupe().listenable();

  ajoutMembre({
    required Membre membre,
    required List<Membre> aloutMbere,
  }) {
    if (!aloutMbere.contains(membre)) {
      setState(() {
        aloutMbere.add(membre);
      });
      //print(aloutMbere);
    } else {
      setState(() {
        aloutMbere.remove(membre);
      });
      //  print(aloutMbere);
    }
  }

  editMembre({
    required int groupeIndex,
    required List<Membre> gp,
    required String nomGroupe,
  }) async {
    await _action.editGroupe(
      index: groupeIndex,
      gp: gp,
      nom: nomGroupe,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
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
        title: Text(
          "GROUPES",
          style: TextStyle(
            color: dark,
            fontSize: 35,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            LineIcons.angleLeft,
          ),
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          didChangeDependencies();
        },
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * .9,
            child: ValueListenableBuilder<Box<Groupe>>(
              valueListenable: listenableGroupe,
              builder: (context, box, _) {
                final groupes = box.values.toList().cast<Groupe>();
                if (groupes.isNotEmpty) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      didChangeDependencies();
                    },
                    child: ListView.builder(
                      itemCount: groupes.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: ((context, index) {
                        final groupe = groupes[index];
                        return groupeWidget(
                          membres: groupe.gp,
                          nomGroupe: groupe.nom,
                          groupeIndex: index,
                        );
                      }),
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 120),
                    child: emptyWidget(
                      bgColor: Colors.white,
                      textColor: dark,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            membreDuGroupe.clear();
          });
          Get.bottomSheet(
            BottomSheet(
              onClosing: () {},
              builder: ((context) {
                return StatefulBuilder(builder: (context, setState) {
                  return Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: dark,
                            width: Get.width,
                            height: 50,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                              child: Text(
                                "Création d'un groupe.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _groupeNameController,
                              maxLines: 4,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: "Nom",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              "Membres du groupe",
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
                            height: 170,
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListView.builder(
                              itemCount: Boxes.getMembre()
                                  .values
                                  .toList()
                                  .cast<Membre>()
                                  .length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                final membre = Boxes.getMembre()
                                    .values
                                    .toList()
                                    .cast<Membre>()[index];
                                if (Boxes.getMembre()
                                    .values
                                    .toList()
                                    .cast<Membre>()
                                    .isNotEmpty) {
                                  return membreDansGroupe(
                                    listDeVerification: membreDuGroupe,
                                    nom: membre.nom,
                                    onTap: () {
                                      ajoutMembre(
                                        membre: membre,
                                        aloutMbere: membreDuGroupe,
                                      );
                                      setState(() {});
                                    },
                                    membre: membre,
                                  );
                                } else {
                                  return Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text("TSY MISY MPIKAMBANA")),
                                  );
                                }
                              }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: MaterialButton(
                                    color: dark,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "enregister",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_groupeNameController
                                              .text.isNotEmpty &&
                                          membreDuGroupe.isNotEmpty) {
                                        await _action.addGroupe(
                                          gp: membreDuGroupe,
                                          nom: _groupeNameController.text,
                                        );
                                        //print(membreDuGroupe);
                                        _groupeNameController.clear();
                                        Navigator.pop(context);
                                      } else {
                                        showMe(
                                          "INFO",
                                          "Veillez bien verifier que le formulaire n'est pas vide et/ou au moins un membre a été selectionner.",
                                          dark,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: MaterialButton(
                                      color: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "annuler",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        _groupeNameController.clear();
                                        membreDuGroupe.clear();

                                        setState(() {});
                                        Navigator.pop(context);
                                      }),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }),
            ),
            persistent: true,
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          LineIcons.plus,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  BottomSheet popAdd({
    required VoidCallback saveButton,
    required String nomDuGroupe,
    required String titre,
    required int groupId,
  }) {
    ttay.clear();
    _groupeNameController.text = nomDuGroupe;
    setState(() {
      ttay = Boxes.getGroupe().values.toList().cast<Groupe>()[groupId].gp;
    });
    return BottomSheet(
      onClosing: () {},
      builder: ((context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: dark,
                    width: Get.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(
                        titre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _groupeNameController,
                      maxLines: 4,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.black38,
                          fontWeight: FontWeight.normal,
                        ),
                        hintText: "Nom",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                      "Membres du groupe",
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
                    height: 170,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemCount: Boxes.getMembre()
                          .values
                          .toList()
                          .cast<Membre>()
                          .length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: ((context, index) {
                        final membre = Boxes.getMembre()
                            .values
                            .toList()
                            .cast<Membre>()[index];
                        return membreDansGroupe(
                          listDeVerification: ttay,
                          nom: membre.nom,
                          onTap: () {
                            ajoutMembre(
                              membre: membre,
                              aloutMbere: ttay,
                            );
                            setState(() {});
                          },
                          membre: membre,
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: MaterialButton(
                            color: dark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "enregister",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: saveButton,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: MaterialButton(
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "annuler",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _groupeNameController.clear();

                                setState(() {});
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  Widget groupeWidget({
    required List<Membre> membres,
    required String nomGroupe,
    required int groupeIndex,
  }) {
    return Container(
      width: Get.width,
      height: 80 + (40 * membres.length).toDouble(),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: dark.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: dark,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * .5,
                  child: Text(
                    "Groupe ${groupeIndex + 1}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Get.bottomSheet(popAdd(
                              groupId: groupeIndex,
                              saveButton: () async {
                                if (_groupeNameController.text.isNotEmpty &&
                                    ttay.isNotEmpty) {
                                  await _action.editGroupe(
                                    index: groupeIndex,
                                    gp: ttay,
                                    nom: _groupeNameController.text,
                                  );
                                  //print(membreDuGroupe);
                                  _groupeNameController.clear();
                                  Navigator.pop(context);
                                } else {
                                  showMe(
                                    "INFO",
                                    "Veillez bien verifier que le formulaire n'est pas vide et/ou au moins un membre a été selectionner.",
                                    dark,
                                  );
                                }
                              },
                              nomDuGroupe: nomGroupe,
                              titre: "Modifier le groupe.",
                            ));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _action.deleteItemAt(
                              boxe: 'groupe',
                              itemId: groupeIndex,
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: (40 * membres.length).toDouble(),
            child: ListView.builder(
              itemCount: membres.length,
              itemBuilder: ((context, index) {
                return Container(
                  //margin: EdgeInsets.symmetric(vertical: 0),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: ListTile(
                    leading: Text(
                      membres[index].nom,
                      style: TextStyle(
                        color: dark,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Text(
                      "P${membres[index].promotion}",
                      style: TextStyle(
                        color: dark,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget membreDansGroupe({
    required String nom,
    required VoidCallback onTap,
    required Membre membre,
    required List<Membre> listDeVerification,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 25),
      title: Text(
        nom,
        style: TextStyle(
          fontSize: 20,
          color: listDeVerification.contains(membre)
              ? Colors.redAccent
              : Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: listDeVerification.contains(membre)
            ? Icon(
                LineIcons.checkCircle,
                size: 30,
                color: Colors.redAccent,
              )
            : Icon(
                LineIcons.circle,
                size: 31,
                color: Colors.black,
              ),
      ),
    );
  }
}
