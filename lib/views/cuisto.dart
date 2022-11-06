import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/views/widgets/card_cuisto.dart';
import 'package:gfs/views/widgets/drawer.dart';
// ignore: unused_import
import 'package:line_icons/line_icons.dart';

class TacheCuisine extends StatefulWidget {
  const TacheCuisine({Key? key}) : super(key: key);

  @override
  _TacheCuisineState createState() => _TacheCuisineState();
}

AppDrawer drawer = AppDrawer();

class _TacheCuisineState extends State<TacheCuisine> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int touchedIndex = -1;
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
          "CUISINE",
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
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * .25,
                child: OrientationBuilder(builder: (context, orientation) {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/ajoutPlat');
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: Get.width,
                          height: Get.height,
                          decoration: BoxDecoration(
                              color: const Color(0xff25272a),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.drumstickWithBiteTakenOut,
                                color: Colors.white,
                                size: Get.width * .2,
                              ),
                              const Text(
                                "SEMAIE A",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "10 plats",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: Get.width,
                          height: Get.height,
                          decoration: BoxDecoration(
                              color: dark,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.cheese,
                                color: Colors.white,
                                size: Get.width * .2,
                              ),
                              const Text(
                                "SEMAINE B",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "5 plats",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Container(
                width: Get.width,
                height: Get.height * .7,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    RecipeCard(
                      title: 'Ravitoto',
                      groupe: 'Groupe2',
                      heureCuisto: '07h30',
                      thumbnailUrl: 'assets/images/food2.png',
                    ),
                    RecipeCard(
                      title: 'Tsaramaso',
                      groupe: 'Groupe1',
                      heureCuisto: '06h30',
                      thumbnailUrl: 'assets/images/food2.png',
                    ),
                    RecipeCard(
                      title: 'Petsay',
                      groupe: 'Groupe3',
                      heureCuisto: '07h30',
                      thumbnailUrl: 'assets/images/food2.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
