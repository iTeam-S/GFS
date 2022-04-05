import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';

import 'package:gfs/views/widgets/drawer.dart';

import 'package:line_icons/line_icons.dart';

class Jirama extends StatefulWidget {
  @override
  _JiramaState createState() => _JiramaState();
}

AppDrawer drawer = AppDrawer();

class _JiramaState extends State<Jirama> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: dark,
          child: Column(
            children: [
              Container(
                height: Get.height * .3,
                color: dark,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Text(
                            "150.482 Ariary",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            "augementation de 20% cette année",
                            style:
                                TextStyle(color: Colors.white54, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 120,
                              height: 40,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                color: Colors.redAccent,
                                child: Text(
                                  "Reload",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                          SizedBox(
                              width: 120,
                              height: 40,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                color: Colors.blueAccent,
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: Get.height * .7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 25,
                        child: Icon(
                          LineIcons.lightningBolt,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Mars",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text("28 feb- 24 mars"),
                      trailing: Text(
                        "150 000Ar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
