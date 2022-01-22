import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

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
                          Ionicons.water_outline,
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
                          Ionicons.fast_food_outline,
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
                          Ionicons.home_outline,
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
                          Ionicons.card_outline,
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
                          Ionicons.today_outline,
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
                          Ionicons.people_outline,
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
