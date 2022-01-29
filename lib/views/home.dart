import 'package:flutter/material.dart';
import 'package:gfs/views/widgets/drawer.dart';

AppDrawer drawer = AppDrawer();

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer,
        appBar: AppBar(
          title: Text('GFS'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(child: Column(children: <Widget>[])));
  }
}
