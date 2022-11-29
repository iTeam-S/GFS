import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/database/db.transaction.dart';
import 'package:gfs/models/budget/budget.model.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:gfs/views/widgets/empty.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';
import '../persistData/data.dart';
import '../utils/dateToString.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

AppDrawer drawer = AppDrawer();

class _BudgetPageState extends State<BudgetPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final TransAction _action = TransAction();
  int touchedIndex = -1;
  final DataApp _data = DataApp();
  List<Budget> listOfBudget = Boxes.getBudget().values.toList().cast<Budget>();

  somme() {
    listOfBudget.forEach((element) => total += element.montant);
  }

  List<Budget> budgetList = [];
  List<double> listMontant = [];
  bool isMultiselected = false;
  List<int> selectedList = [];
  double total = 0.0;

  String percent(double one) {
    String pourcent = "";
    pourcent = ((one * 100) / total).toStringAsFixed(2);
    return pourcent + "%";
  }

  delete() {
    selectedList.forEach((element) {
      _action.deleteItemAt(boxe: 'budget', itemId: element);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      listOfBudget = Boxes.getBudget().values.toList().cast<Budget>();
      total = 0.0;
      somme();
    });
  }

  @override
  void initState() {
    somme();
    super.initState();
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
      body: Container(
        color: dark,
        width: Get.width,
        height: Get.height,
        child: RefreshIndicator(
          backgroundColor: dark,
          color: Colors.white,
          onRefresh: () async {
            didChangeDependencies();
            setState(() {});
          },
          child: SingleChildScrollView(
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
                  height: 330,
                  //padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 100 + (3 * total.toString().length.toDouble()),
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: dark,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            "$total Ar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 260,
                        width: 200,
                        color: Colors.transparent,
                        child: AspectRatio(
                          aspectRatio: .7,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
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
                              sectionsSpace: 1,
                              centerSpaceRadius: 40,
                              sections: Boxes.getBudget().isNotEmpty
                                  ? show()
                                  : [
                                      PieChartSectionData(
                                        color: orange,
                                        value: 100,
                                        showTitle: false,
                                        radius: 50,
                                        borderSide: BorderSide(
                                          color: dark,
                                          width: 0.5,
                                        ),
                                      )
                                    ],
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
                  height: Get.height * .6,
                  padding: EdgeInsets.only(bottom: 30),
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
                            return cardWidget(
                              id: index,
                              type: budget.type,
                              montant: budget.montant,
                              titre: budget.titre,
                              dateDebut: budget.dateDebut,
                              dateFin: budget.dateFin,
                              isSelected: selectedList.contains(index),
                              onTap: () {
                                if (isMultiselected) {
                                  if (!selectedList.contains(index)) {
                                    selectedList.add(index);
                                    // print("add $index");
                                    // print(selectedList);
                                    setState(() {});
                                  } else {
                                    selectedList.remove(index);
                                    // print("remove $index");
                                    // print(selectedList);
                                    setState(() {});
                                  }
                                }
                              },
                            );
                          }),
                        );
                      } else {
                        return emptyWidget();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isMultiselected
          ? FloatingActionButton(
              onPressed: () async {
                if (selectedList.isEmpty) {
                  setState(() {
                    isMultiselected = false;
                    selectedList.clear();
                  });
                } else {
                  await delete();
                  selectedList.clear();
                  setState(
                    () {
                      isMultiselected = false;
                    },
                  );
                }
              },
              backgroundColor: Colors.red,
              child: selectedList.isEmpty
                  ? Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    )
                  : Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
            )
          : FloatingActionButton(
              onPressed: () {
                Get.toNamed('/ajoutBudget');
              },
              backgroundColor: Colors.white,
              child: Icon(
                LineIcons.plus,
                color: Colors.black,
              ),
            ),
    );
  }

  Widget cardWidget({
    required int type,
    required int id,
    required double montant,
    required String titre,
    required DateTime dateDebut,
    required DateTime dateFin,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
        color: !(isMultiselected && isSelected)
            ? Colors.transparent
            : Colors.white12,
      ),
      child: ListTile(
        onLongPress: () {
          setState(() {
            isMultiselected = !isMultiselected;
          });
        },
        leading: CircleAvatar(
          backgroundColor: _data.listCategorie[type].couleur,
          radius: 25,
          child: Icon(
            _data.listCategorie[type].icon,
            size: 32,
            color: Colors.white,
          ),
        ),
        title: Text(
          titre,
          style: TextStyle(fontSize: 20, color: Color(0xff0293ee)),
        ),
        subtitle: Text(
          "${toDateN(dateDebut)} - ${toDateN(dateFin)}",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        trailing: isMultiselected
            ? IconButton(
                onPressed: onTap,
                icon: selectedList.contains(id)
                    ? Icon(
                        LineIcons.checkCircle,
                        size: 32,
                        color: Colors.red,
                      )
                    : Icon(
                        LineIcons.circle,
                        size: 33,
                        color: Colors.red,
                      ),
              )
            : Text(
                "$montant Ar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  List<PieChartSectionData> show() {
    return List.generate(Boxes.getBudget().length, (index) {
      final budget = Boxes.getBudget().values.toList().cast<Budget>()[index];
      final isTouched = index == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;

      return PieChartSectionData(
        color: _data.listCategorie[budget.type].couleur
            .withOpacity(isTouched ? 0.2 : 1),
        value: budget.montant,
        title: isTouched ? "${budget.montant} Ar" : percent(budget.montant),
        titlePositionPercentageOffset: isTouched ? 1.3 : 1.7,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: _data.listCategorie[budget.type].couleur,
        ),
      );
    });
  }
}
