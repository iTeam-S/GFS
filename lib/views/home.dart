import 'package:flutter/material.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';

AppDrawer drawer = AppDrawer();

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: drawer,
        appBar: AppBar(
          elevation: 0,
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
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(child: Column(children: <Widget>[])));
  }
}
