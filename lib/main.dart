import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gfs/views/agenda.dart';
import 'package:gfs/views/exemple.dart';
import 'package:gfs/views/home.dart';
import 'package:gfs/views/jirama.dart';
import 'package:gfs/views/login.dart';
import 'package:gfs/views/membres.dart';
import 'package:gfs/views/register.dart';
import 'package:gfs/views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GFS',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: "ProductSans"),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => Screen(),
        '/jirama': (context) => Jirama(),
        '/agenda': (context) => CalendarPage(),
        '/membre': (context) => MembreList(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/test': (context) => MyHomePage(),
      },
    );
  }
}
