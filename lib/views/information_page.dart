import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
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
        centerTitle: true,
        title: Text(
          "INFORMATION",
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
    );
  }
}
