// ignore_for_file: cancel_subscriptions

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';

import 'package:line_icons/line_icons.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

int selectedIndex = 0;

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: orange,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              color: orange,
              height: 230,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Get.offAllNamed('/login');
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red.shade900,
                            child: Icon(
                              LineIcons.alternateSignOut,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Get.offAllNamed('/home');
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              LineIcons.home,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "snap",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          "Chef de foyer",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(.5),
              height: 1,
              thickness: 1,
            ),
            Container(
              child: Column(
                children: [
                  menuItems(
                    itemName: 'Jirama',
                    itemIcon: LineIcons.plug,
                    isSelected: selectedIndex == 1,
                    voidCallback: () {
                      Get.offAllNamed('/jirama');
                      setState(
                        () {
                          selectedIndex = 1;
                        },
                      );
                    },
                  ),
                  menuItems(
                    itemName: 'Cuisine',
                    itemIcon: LineIcons.utensils,
                    isSelected: selectedIndex == 2,
                    voidCallback: () {
                      Get.offAllNamed('/cuisine');
                      setState(
                        () {
                          selectedIndex = 2;
                        },
                      );
                    },
                  ),
                  menuItems(
                    itemName: 'Ménage',
                    itemIcon: LineIcons.couch,
                    isSelected: selectedIndex == 3,
                    voidCallback: () {
                      // Get.offAllNamed( '/membre');
                      setState(
                        () {
                          selectedIndex = 3;
                        },
                      );
                    },
                  ),
                  menuItems(
                    itemName: 'Budget',
                    itemIcon: LineIcons.coins,
                    isSelected: selectedIndex == 4,
                    voidCallback: () {
                      Get.offAllNamed('/budget');
                      setState(
                        () {
                          selectedIndex = 4;
                        },
                      );
                    },
                  ),
                  menuItems(
                    itemName: 'Agenda',
                    itemIcon: LineIcons.calendar,
                    isSelected: selectedIndex == 5,
                    voidCallback: () {
                      Get.offAllNamed('/agenda');
                      setState(
                        () {
                          selectedIndex = 5;
                        },
                      );
                    },
                  ),
                  menuItems(
                    itemName: 'Membres',
                    itemIcon: LineIcons.users,
                    isSelected: selectedIndex == 6,
                    voidCallback: () {
                      Get.offAllNamed('/membre');
                      setState(
                        () {
                          selectedIndex = 6;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget menuItems({
    required String itemName,
    required IconData itemIcon,
    required bool isSelected,
    required VoidCallback voidCallback,
  }) {
    return Container(
      color: isSelected ? Colors.black.withOpacity(.2) : Colors.transparent,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 17,
        ),
        style: ListTileStyle.drawer,
        onTap: voidCallback,
        title: Text(
          itemName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: isSelected ? Colors.white : dark,
          child: Icon(
            itemIcon,
            color: isSelected ? Colors.black : Colors.white,
            size: 27,
          ),
        ),
      ),
    );
  }
}
