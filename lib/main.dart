import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/controllers/auth_logique.dart';
import 'package:gfs/views/agenda.dart';
import 'package:gfs/views/budget.dart';
import 'package:gfs/views/cuisto.dart';
import 'package:gfs/views/exemple.dart';
import 'package:gfs/views/home.dart';
import 'package:gfs/views/jirama.dart';
import 'package:gfs/views/login.dart';
import 'package:gfs/views/membres.dart';
import 'package:gfs/views/register.dart';
import 'package:gfs/views/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Future.delayed(Duration(milliseconds: 2000), () {
      Get.offNamed('/home');
    });*/
    AuthLogique authLogique = Get.put(AuthLogique());
    return Provider(
      create: (BuildContext context) => authLogique,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GFS',
        theme:
            ThemeData(primarySwatch: Colors.orange, fontFamily: "ProductSans"),
        initialRoute: '/login',
        routes: {
          '/': (context) => Splash(),
          '/home': (context) => Screen(),
          '/jirama': (context) => Jirama(),
          '/agenda': (context) => CalendarPage(),
          '/membre': (context) => MembreList(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/test': (context) => MyHomePage(),
          '/cuisine': (context) => TacheCuisine(),
          '/budget': (context) => Budget(),
        },
      ),
    );
  }
}
