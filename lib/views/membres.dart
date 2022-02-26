import 'package:flutter/material.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';

AppDrawer drawer = AppDrawer();

class MembreList extends StatelessWidget {
  const MembreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      backgroundColor: Color(0xff25272a),
      key: _key,
      drawer: drawer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff25272a),
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            LineIcons.verticalEllipsis,
          ),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFF8C2D)),
              child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: Icon(
                      LineIcons.userCircle,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  title: Text(
                    "Dominick Randria",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Row(
                    children: <Widget>[
                      Icon(LineIcons.graduationCap, color: Colors.orange),
                      Text(" P20", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0)),
            )
          ])),
    );
  }
}
