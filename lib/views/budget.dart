import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/models/budget/budget.model.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';
import '../persistData/data.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

AppDrawer drawer = AppDrawer();

class _BudgetPageState extends State<BudgetPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int touchedIndex = -1;
  final DataApp _data = DataApp();
  List<Budget> budgetList = [];
  List<double> listMontant = [];
  double total = 0.0;
  String percent(double one) {
    String pourcent = "";
    // pourcent =(100- (100 - one));
    return pourcent;
  }

  String toDateN(DateTime dateTime) {
    String date = "";
    date = "${dateTime.day} ${_data.mois[dateTime.month].toLowerCase()}";
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: drawer,
      backgroundColor: dark,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        title: Text(
          "BUDGET",
          style: TextStyle(
            color: dark,
            fontSize: 35,
          ),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                width: Get.width,
                height: Get.height * .45,
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      color: Colors.white,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {});
                              },
                              padding: EdgeInsets.zero,
                              color: dark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(
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
                                centerSpaceRadius: 60,
                                sections: show(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "total : $total Ar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: dark,
                width: Get.width,
                height: Get.height * .5,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ValueListenableBuilder<Box<Budget>>(
                  valueListenable: Boxes.getBudget().listenable(),
                  builder: (context, box, _) {
                    final budgets = box.values.toList().cast<Budget>();
                    if (budgets.isNotEmpty) {
                      return ListView.builder(
                        itemCount: budgets.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          final budget = budgets[index];
                          listMontant.add(budget.montant);
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  _data.listCategorie[budget.type].couleur,
                              radius: 25,
                              child: Icon(
                                _data.listCategorie[budget.type].icon,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              budget.titre,
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff0293ee)),
                            ),
                            subtitle: Text(
                              "${toDateN(budget.dateDebut)} - ${toDateN(budget.dateFin)}",
                              style: TextStyle(color: Colors.white54),
                            ),
                            trailing: Text(
                              "${budget.montant} Ar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                      );
                    } else {
                      return Container(
                        color: orange,
                        width: 50,
                        height: 50,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/ajoutBudget');
        },
        backgroundColor: dark,
        child: Icon(
          LineIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }

  List<PieChartSectionData> show() {
    return List.generate(Boxes.getBudget().length, (index) {
      final budget = Boxes.getBudget().values.toList().cast<Budget>()[index];
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      return PieChartSectionData(
        color: _data.listCategorie[index].couleur,
        value: budget.montant,
        title: budget.montant.toString(),
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
      );
    });
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
