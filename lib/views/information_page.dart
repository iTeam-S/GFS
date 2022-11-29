import 'package:flutter/material.dart';
import 'package:gfs/constants.dart';
import 'package:line_icons/line_icons.dart';

import 'widgets/drawer.dart';

AppDrawer drawer = AppDrawer();

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      backgroundColor: dark,
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
        centerTitle: true,
        title: Text(
          "INFORMATION",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    );
  }
}
