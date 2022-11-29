import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/database/db.transaction.dart';
import 'package:gfs/models/jirama/jirama.model.dart';

import 'package:gfs/views/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:line_icons/line_icons.dart';

import '../database/db.service.dart';
import '../utils/dateToString.dart';
import 'widgets/empty.dart';

class JiramaPage extends StatefulWidget {
  @override
  _JiramaPageState createState() => _JiramaPageState();
}

AppDrawer drawer = AppDrawer();

class _JiramaPageState extends State<JiramaPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final TransAction _action = TransAction();
  List<Jirama> listOfJirama = Boxes.getJirama().values.toList().cast<Jirama>();

  somme() {
    listOfJirama.forEach((element) => total += element.montant);
  }

  delete() {
    selectedList.forEach((element) {
      _action.deleteItemAt(boxe: 'jirama', itemId: element);
    });
  }

  bool isMultiselected = false;
  List<int> selectedList = [];
  double total = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      listOfJirama = Boxes.getJirama().values.toList().cast<Jirama>();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: dark,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            LineIcons.verticalEllipsis,
          ),
          color: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          didChangeDependencies();
        },
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            color: dark,
            child: Column(
              children: [
                Container(
                  color: dark,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: (total.toString().length <= 16) ? 90 : 130,
                        margin: EdgeInsets.symmetric(vertical: 25),
                        //color: Colors.amber,
                        child: Column(
                          children: [
                            Text(
                              "$total Ar",
                              textAlign: TextAlign.center,

                              /// overflow: TextOverflow.,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              // "augementation de 20% cette année",
                              "La somme de vos depenses en JIRAMA.",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: Get.height * .7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: ValueListenableBuilder<Box<Jirama>>(
                    valueListenable: Boxes.getJirama().listenable(),
                    builder: (context, box, _) {
                      final budgets = box.values.toList().cast<Jirama>();
                      if (budgets.isNotEmpty) {
                        return ListView.builder(
                          itemCount: budgets.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            final budget = budgets[index];

                            return cardJirama(
                              id: index,
                              montant: budget.montant,
                              mois: budget.moisDePayment,
                              dateDebut: budget.dateDebut,
                              dateFin: budget.dateFin,
                              isSelected: selectedList.contains(index),
                              onTap: () {
                                if (isMultiselected) {
                                  if (!selectedList.contains(index)) {
                                    selectedList.add(index);
                                    //print("add $index");
                                    //print(selectedList);
                                    setState(() {});
                                  } else {
                                    selectedList.remove(index);
                                    //print("remove $index");
                                    //print(selectedList);
                                    setState(() {});
                                  }
                                }
                              },
                            );
                          }),
                        );
                      } else {
                        return emptyWidget(
                          bgColor: Colors.white,
                          textColor: dark,
                        );
                      }
                    },
                  ),
                ),
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
                  setState(
                    () {
                      isMultiselected = false;
                      selectedList.clear();
                    },
                  );
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
                Get.toNamed('/ajoutJirama');
              },
              backgroundColor: dark,
              child: Icon(
                LineIcons.plus,
                color: Colors.white,
              ),
            ),
    );
  }

  Widget cardJirama({
    required int id,
    required double montant,
    required String mois,
    required DateTime dateDebut,
    required DateTime dateFin,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onLongPress: () {
        setState(() {
          isMultiselected = !isMultiselected;
        });
      },
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        backgroundImage: ExactAssetImage(
          'assets/images/jirama.png',
        ),
        radius: 30,
      ),
      title: Text(
        mois,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text("${toDateN(dateDebut)} - ${toDateN(dateFin)}"),
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
                color: Colors.black,
              ),
            ),
    );
  }
}
