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

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _ScreenState extends State<Screen> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 150,
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
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "cuisine",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: Get.width,
            height: Get.height * .3,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: LineChartSample2(),
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * .35,
            child: Swiper(
              itemCount: 5,
              itemBuilder: (BuildContext context, int id) {
                return Container(
                  height: Get.height * .8,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Tache+equipe",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                );
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
            ),
          ),
        ])));
  }
}
