import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gfs/views/agenda.dart';
import 'package:gfs/views/home.dart';
import 'package:gfs/views/jirama.dart';
import 'package:gfs/views/membres.dart';

void main() {
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
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Screen(),
        '/jirama': (context) => Jirama(),
        '/agenda': (context) => CalendarPage(),
        '/membre': (context) => MembreList(),
      },
    );
  }
}
