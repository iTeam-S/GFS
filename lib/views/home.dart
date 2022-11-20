import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/persistData/data.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';
import '../models/menage/task_assign.model.dart';
import '../models/menage/tour_menage.model.dart';

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
  final DataApp _data = DataApp();

  @override
  void initState() {
    taches = listOfTask[0]
        .description
        .where((value) => DateTime.now().day == value.jour)
        .toList();
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
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  backgroundColor: dark,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            width: Get.width,
            height: Get.height * .62,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int id) {
                      return Container(
                        width: 315,
                        height: Get.height,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: Offset(10, 5),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * .25,
            child: Swiper(
              itemCount: taches.length,
              itemBuilder: (BuildContext context, int id) {
                return Container(
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
                                "GROUPE " + taches[id].groupe.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _data.jours[DateTime(DateTime.now().year,
                                      DateTime.now().month, taches[id].jour)
                                  .weekday],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Nettoyage cours exterieur et débarassage",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                );
              },
              // indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              //pagination: const SwiperPagination(),
              //control: const SwiperControl(),
            ),
          ),
        ])));
  }
}
