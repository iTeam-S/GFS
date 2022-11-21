import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/database/db.transaction.dart';
import 'package:gfs/models/menage/place.model.dart';
import 'package:gfs/views/widgets/snack_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';
import '../database/db.service.dart';
import 'widgets/drawer.dart';
import 'widgets/empty.dart';

class TourDeMenage extends StatefulWidget {
  const TourDeMenage({Key? key}) : super(key: key);

  @override
  State<TourDeMenage> createState() => _TourDeMenageState();
}

AppDrawer drawer = AppDrawer();

class _TourDeMenageState extends State<TourDeMenage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController _titreTextController = TextEditingController();
  TextEditingController _descriTextController = TextEditingController();

  TransAction _action = TransAction();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: drawer,
      //backgroundColor: Color(0xff25272a),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MENAGE",
          style: TextStyle(color: Colors.black, fontSize: 35),
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
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * .95,
                padding: EdgeInsets.only(bottom: 50),
                child: ValueListenableBuilder<Box<Emplacement>>(
                  valueListenable: Boxes.getEmplacement().listenable(),
                  builder: (context, box, _) {
                    final places = box.values.toList().cast<Emplacement>();
                    if (places.isNotEmpty) {
                      return ListView.builder(
                        itemCount: places.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          final place = places[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.7),
                                  offset: Offset(
                                    5.0,
                                    10.0,
                                  ),
                                  blurRadius: 15.0,
                                  spreadRadius: -10.0,
                                ),
                              ],
                            ),
                            // height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "TACHE ${index + 1}",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          onPressed: () {
                                            _action.deleteItemAt(
                                              boxe: 'place',
                                              itemId: index,
                                            );
                                          },
                                          color: Colors.redAccent,
                                          child: Icon(
                                            Icons.delete_forever,
                                            color: Colors.white,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    place.place,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    place.description,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: Get.height * .2),
                        child: emptyWidget(
                          bgColor: Colors.white,
                          textColor: dark,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(popAdd(
            saveButton: () async {
              if (_titreTextController.text.isNotEmpty ||
                  _descriTextController.text.isNotEmpty) {
                await _action.addEmplacement(
                  place: _titreTextController.text,
                  description: _descriTextController.text,
                );
                _titreTextController.clear();
                _descriTextController.clear();
                Navigator.pop(context);
              } else {
                showMe(
                  "ALERT",
                  "L'un de vos formulaires est vide !",
                  dark,
                );
              }
            },
          ));
        },
        backgroundColor: dark,
        child: Icon(
          LineIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }

  BottomSheet popAdd({
    required VoidCallback saveButton,
  }) {
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
                        "Ajout d'une nouvelle tache",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                      "Nom de votre tache",
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
                      controller: _titreTextController,
                      maxLines: 2,
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
                        hintText: "ex : fanadiovana W.C",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                      "Description de votre tache",
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
                      horizontal: 10,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _descriTextController,
                      maxLines: 5,
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
                        hintText: "comment effectuer votre tache ?",
                        border: InputBorder.none,
                      ),
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
                                _titreTextController.clear();
                                _descriTextController.clear();
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
}
