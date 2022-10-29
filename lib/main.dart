import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/database/db.service.dart';

import 'package:gfs/views/agenda.dart';
import 'package:gfs/views/ajout_budget.dart';
import 'package:gfs/views/budget.dart';
import 'package:gfs/views/cuisto.dart';
import 'package:gfs/views/exemple.dart';
import 'package:gfs/views/home.dart';
import 'package:gfs/views/jirama.dart';
import 'package:gfs/views/login.dart';
import 'package:gfs/views/membres.dart';
import 'package:gfs/views/register.dart';
import 'package:gfs/views/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

final HiveDatabase _hiveDatabase = HiveDatabase();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  _hiveDatabase.openTableBox();
  _hiveDatabase.registreAdapter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Future.delayed(Duration(milliseconds: 2000), () {
      Get.offNamed('/home');
    });*/

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GFS',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: "ProductSans"),
      initialRoute: '/home',
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => Screen(),
        '/jirama': (context) => JiramaPage(),
        '/agenda': (context) => CalendarPage(),
        '/membre': (context) => MembreList(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/test': (context) => MyHomePage(),
        '/cuisine': (context) => TacheCuisine(),
        '/budget': (context) => BudgetPage(),
        '/ajoutBudget': (context) => AjoutBudgetPage(),
      },
    );
  }
}
