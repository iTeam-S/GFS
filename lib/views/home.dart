import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  backgroundColor: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            width: Get.width,
            height: 170,
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
                            decoration: BoxDecoration(
                                // color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFFF8C2D),
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
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            height: 40,
                            width: Get.width * .5,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF8C2D),
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
                          Text(
                            "GROUPE 3",
                            style: TextStyle(color: Colors.white, fontSize: 25),
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
