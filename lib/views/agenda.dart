import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';

AppDrawer drawer = AppDrawer();

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: drawer,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Icon(
              LineIcons.verticalEllipsis,
            ),
            color: Colors.white,
          ),
          title: Text(
            "AGENDA",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Scaffold(
            body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.black,
                width: Get.width,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lundi, 12 février",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xFFFF8C2D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "Ajouter",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height * .755,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: ListView(
                  children: [CardTask()],
                ),
              ),
            ],
          ),
        )));
  }
}

class CardTask extends StatelessWidget {
  const CardTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: Get.width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: Get.width * .1,
                decoration: BoxDecoration(
                  color: Color(0xFFFF8C2D),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "G",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width * .8,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Cuisine matin et nettoyage exterieur",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                        width: Get.width * .55,
                        height: 20,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Text(
                                      "Dominick-",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: Get.width * .2,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Text(
                  "07:15",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
