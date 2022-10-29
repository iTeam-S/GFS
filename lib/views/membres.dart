import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/database/db.transaction.dart';
import 'package:gfs/models/membre/membre.model.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';

AppDrawer drawer = AppDrawer();

class MembreList extends StatefulWidget {
  const MembreList({Key? key}) : super(key: key);

  @override
  State<MembreList> createState() => _MembreListState();
}

class _MembreListState extends State<MembreList> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _promController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _esController = TextEditingController();

  final TransAction _action = TransAction();
  List<Membre> membresList = [];
  bool isEmpt = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: drawer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MEMBRES",
          style: TextStyle(
            color: dark,
            fontSize: 35,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            LineIcons.verticalEllipsis,
          ),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * .9,
          child: ValueListenableBuilder<Box<Membre>>(
            valueListenable: Boxes.getMembre().listenable(),
            builder: (context, box, _) {
              final membres = box.values.toList().cast<Membre>();
              if (membres.isNotEmpty) {
                return ListView.builder(
                  itemCount: membres.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    final membre = membres[index];
                    return cardMembre(
                      index: index,
                      name: membre.nom,
                      prom: membre.promotion.toString(),
                    );
                  }),
                );
              } else {
                return Container(
                  color: orange,
                  width: 50,
                  height: 50,
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popEdit();
        },
        backgroundColor: Colors.black,
        child: Icon(
          LineIcons.plus,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }

  Widget cardMembre({
    required int index,
    required String name,
    required String prom,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: orange,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(
                width: 1.0,
                color: Colors.white24,
              ),
            ),
          ),
          child: Icon(
            LineIcons.userCircle,
            color: Colors.white,
            size: 40,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(
              LineIcons.graduationCap,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "P$prom",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            _action.deleteItemAt(
              boxe: 'membre',
              itemId: index,
            );
          },
          icon: Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  Future popEdit() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            children: [
              Container(
                height: 350,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              child: Text(
                                "Ajour de nouvau membre",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _nameController,
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
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _promController,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    prefixText: 'P',
                                    prefixStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    suffixStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText:
                                        "Promotion (ex: ecrire 20 si P20)",
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _roleController,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText: "role",
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _esController,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText: "ES",
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: MaterialButton(
                              color: isEmpt ? orange.withOpacity(0.4) : orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "enregister",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                if (_nameController.text.isNotEmpty ||
                                    _esController.text.isNotEmpty ||
                                    _promController.text.isNotEmpty ||
                                    _roleController.text.isNotEmpty) {
                                  _action.addMembre(
                                    nom: _nameController.text,
                                    promotion: int.parse(_promController.text),
                                    es: _esController.text,
                                    role: _roleController.text,
                                  );
                                  _nameController.clear();
                                  _promController.clear();
                                  _roleController.clear();
                                  _esController.clear();
                                  Navigator.pop(context);
                                } else {
                                  setState(
                                    () {
                                      isEmpt = true;
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "annuler",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
