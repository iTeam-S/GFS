import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/views/widgets/chart.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';

AppDrawer drawer = AppDrawer();

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
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
            height: 180,
            child: Row(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int id) {
                          return Container(
                            width: 150,
                            height: Get.height,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(top: 7),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 12,
                                      spreadRadius: 0,
                                      offset: Offset(10, 5))
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: orange,
                                    ),
                                    height: 70,
                                    width: Get.width,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "SEMAINE B",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/Food_PNG.png',
                                  width: Get.width * .3,
                                ),
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(7),
            width: Get.width,
            height: Get.height * .35,
            child: BarChartSample1(),
          ),
          Container(
            width: Get.width,
            height: Get.height * .25,
            child: Swiper(
              itemCount: 5,
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
                                "LUNDI",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "GROUPE 3",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Nettoyage cours exterieur et d??barassage",
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
