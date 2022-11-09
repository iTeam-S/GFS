import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/views/widgets/card_cuisto.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: unused_import
import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';
import '../models/cuisine/plat.model.dart';
import 'widgets/empty.dart';

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
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * .9,
                child: ValueListenableBuilder<Box<Plat>>(
                  valueListenable: Boxes.getPlat().listenable(),
                  builder: (context, box, _) {
                    final plats = box.values.toList().cast<Plat>();
                    if (plats.isNotEmpty) {
                      return ListView.builder(
                        itemCount: plats.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          final plat = plats[index];
                          return RecipeCard(
                            title: plat.nom,
                            commentaire: plat.commentaire,
                            prix: plat.prix.toString(),
                            categorie: plat.categorie,
                            ingredient: plat.compositions,
                          );
                        }),
                      );
                    } else {
                      return emptyWidget();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/ajoutPlat');
        },
        backgroundColor: dark,
        child: Icon(
          LineIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }
}
