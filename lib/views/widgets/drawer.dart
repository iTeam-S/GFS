import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(25),
                color: Colors.red,
                height: Get.height * .45,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 45,
                    ),
                    Text(
                      "Dominick Randriamanantena",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Chef de foyer",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text("Jirama"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(
                          LineIcons.plug,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text("Cuisine"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Icon(
                          LineIcons.utensils,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text("Ménage"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          LineIcons.couch,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text("Budget"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Icon(
                          LineIcons.coins,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text("Agenda"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Icon(
                          LineIcons.calendar,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text("Membres"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          LineIcons.users,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
