import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';

AppDrawer drawer = AppDrawer();

class MembreList extends StatelessWidget {
  const MembreList({Key? key}) : super(key: key);

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
        centerTitle: true,
        title: Text(
          "MEMBRES",
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            LineIcons.verticalEllipsis,
          ),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardMembre(name: 'Dominick', prom: 'P20'),
              cardMembre(name: 'Grégoire', prom: 'P40'),
              cardMembre(name: 'Cekah', prom: 'P50'),
              cardMembre(name: 'Randria', prom: 'P60'),
            ]),
      )),
    );
  }

  Widget cardMembre({
    required String name,
    required String prom,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: orange),
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(
              LineIcons.userCircle,
              color: Colors.white,
              size: 40,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(LineIcons.graduationCap, color: Colors.black),
              Text(prom, style: TextStyle(color: Colors.white))
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0)),
    );
  }
}
