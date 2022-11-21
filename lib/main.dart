import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'database/db.service.dart';
import 'views/agenda.dart';
import 'views/ajout_budget.dart';
import 'views/ajout_jirama.dart';
import 'views/ajout_plat.dart';
import 'views/budget.dart';
import 'views/cuisto.dart';
import 'views/exemple.dart';
import 'views/groupe.dart';
import 'views/home.dart';
import 'views/jirama.dart';
import 'views/login.dart';
import 'views/membres.dart';
import 'views/menage_page.dart';
import 'views/register.dart';
import 'views/splash.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GFS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: "ProductSans",
      ),
      initialRoute: '/',
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
        '/ajoutJirama': (context) => AjoutJirmaPage(),
        '/groupe': (context) => GroupePage(),
        '/ajoutPlat': (context) => AjoutPlatPage(),
        '/menage': (context) => TourDeMenage(),
      },
    );
  }
}

//si tu veux builder la base de donnée Hive :
//commande à executer une fois seulement ou en cas de modification d'un Model
//flutter packages pub run build_runner build --delete-conflicting-outputs