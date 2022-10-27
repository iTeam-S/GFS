import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:gfs/views/widgets/indicator.dart';
import 'package:line_icons/line_icons.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

AppDrawer drawer = AppDrawer();

class _BudgetPageState extends State<BudgetPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: drawer,
      backgroundColor: dark,
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
      ),
      body: SingleChildScrollView(
        child: Container(
          color: dark,
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: Get.width,
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: Offset(2, 5))
                      ]),
                  child: Center(
                    child: Text(
                      "280 000 Ar",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                width: Get.width,
                height: Get.height * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 300,
                        child: AspectRatio(
                          aspectRatio: .7,
                          child: PieChart(
                            PieChartData(
                                pieTouchData: PieTouchData(touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                }),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                                sections: showingSections()),
                          ),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Indicator(
                          color: Color(0xff0293ee),
                          text: 'Eau',
                          isSquare: false,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Color(0xfff8b250),
                          text: 'Electricité',
                          isSquare: false,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Color(0xff845bef),
                          text: 'Nouriture',
                          isSquare: false,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Color(0xff13d38e),
                          text: 'Vetement',
                          isSquare: false,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: dark,
                width: Get.width,
                height: Get.height * .5,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xff0293ee),
                        radius: 25,
                        child: Icon(
                          LineIcons.shower,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Eau",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff0293ee)),
                      ),
                      subtitle: Text(
                        "28 feb- 24 mars",
                        style: TextStyle(color: Colors.white54),
                      ),
                      trailing: Text(
                        "100 000Ar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xfff8b250),
                        radius: 25,
                        child: Icon(
                          LineIcons.carBattery,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Electricité",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xfff8b250)),
                      ),
                      subtitle: Text(
                        "28 feb- 24 mars",
                        style: TextStyle(color: Colors.white54),
                      ),
                      trailing: Text(
                        "80 000Ar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xff845bef),
                        radius: 25,
                        child: Icon(
                          LineIcons.hamburger,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Nouriture",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff845bef)),
                      ),
                      subtitle: Text(
                        "28 feb- 24 mars",
                        style: TextStyle(color: Colors.white54),
                      ),
                      trailing: Text(
                        "50 000Ar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xff13d38e),
                        radius: 25,
                        child: Icon(
                          LineIcons.tShirt,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Vetement",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff13d38e)),
                      ),
                      subtitle: Text(
                        "28 feb- 24 mars",
                        style: TextStyle(color: Colors.white54),
                      ),
                      trailing: Text(
                        "50 000Ar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
