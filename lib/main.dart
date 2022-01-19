import 'package:flutter/material.dart';

import 'package:gfs/views/home.dart';

void main() {
  runApp(MyApp());
}

/*
IL Y A ENCORE BEAUCOUP D'ORGANISATION À FAIRE , VEILLEZ PREVENIR AVANT LA CONTRIBUTION
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GFS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
