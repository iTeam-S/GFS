import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/models/menage/place.model.dart';
import 'package:gfs/persistData/data.dart';
import 'package:gfs/views/widgets/card_cuisto.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';
import '../models/cuisine/plat.model.dart';
import '../models/menage/task_assign.model.dart';
import '../models/menage/tour_menage.model.dart';
import 'widgets/empty.dart';

AppDrawer drawer = AppDrawer();

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  List<TaskAssign> taches = [];
  List<TourMenage> listOfTask =
      Boxes.getTourMenage().values.toList().cast<TourMenage>();
  List<Emplacement> listOfPlace =
      Boxes.getEmplacement().values.toList().cast<Emplacement>();
  final DataApp _data = DataApp();

  @override
  void initState() {
    if (listOfTask.isNotEmpty) {
      taches = listOfTask[0]
          .description
          .where((value) => DateTime.now().day == value.jour)
          .toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        drawer: drawer,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Icon(
              LineIcons.verticalEllipsis,
            ),
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "GFS",
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            width: Get.width,
            height: Get.height * .62,
            child: Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder<Box<Plat>>(
                    valueListenable: Boxes.getPlat().listenable(),
                    builder: (context, box, _) {
                      final plats = box.values.toList().cast<Plat>();
                      if (plats.isNotEmpty) {
                        return ListView.builder(
                          itemCount: plats.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            final plat = plats[index];
                            return SizedBox(
                              width: Get.width * .95,
                              child: RecipeCard(
                                isHome: true,
                                title: plat.nom,
                                commentaire: plat.commentaire,
                                prix: plat.prix.toString(),
                                categorie: plat.categorie,
                                ingredient: plat.compositions,
                              ),
                            );
                          }),
                        );
                      } else {
                        return emptyWidget(
                          bgColor: Colors.white,
                          textColor: dark,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * .25,
            child: taches.isNotEmpty
                ? Swiper(
                    itemCount: taches.length,

                    itemBuilder: (BuildContext context, int id) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: dark,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 5),
                                    height: 35,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: _data.couleurTache[
                                            taches[id].groupe.isNaN
                                                ? Random()
                                                    .nextInt(taches[id].groupe)
                                                : taches[id].groupe],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: Text(
                                        "GROUPE " +
                                            taches[id].groupe.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Expanded(
                                    child: Text(
                                      _data.jours[DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              taches[id].jour)
                                          .weekday],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Text(
                                "${listOfPlace[id].place} (${listOfPlace[id].description})",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    // indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    //pagination: const SwiperPagination(),
                    //control: const SwiperControl(),
                  )
                : Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: dark, borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              height: 35,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  "GROUPE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _data.jours[DateTime.now().weekday],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Il n'y a pas encore de tache.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
          ),
        ])));
  }
}
