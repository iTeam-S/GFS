// ignore_for_file: cancel_subscriptions

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';

import 'package:line_icons/line_icons.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

late String userPic;
late String userName;

class _AppDrawerState extends State<AppDrawer> {
  @override
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
                            Get.toNamed('/login');
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
                          onTap: () => Get.toNamed('/home'),
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
                    itemRoute: '/jirama',
                  ),
                  menuItems(
                    itemName: 'Cuisine',
                    itemIcon: LineIcons.utensils,
                    itemRoute: '/cuisine',
                  ),
                  menuItems(
                    itemName: 'Ménage',
                    itemIcon: LineIcons.couch,
                    itemRoute: '/membre',
                  ),
                  menuItems(
                    itemName: 'Budget',
                    itemIcon: LineIcons.coins,
                    itemRoute: '/budget',
                  ),
                  menuItems(
                    itemName: 'Agenda',
                    itemIcon: LineIcons.calendar,
                    itemRoute: '/agenda',
                  ),
                  menuItems(
                    itemName: 'Membres',
                    itemIcon: LineIcons.users,
                    itemRoute: '/membre',
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
    required String itemRoute,
  }) {
    return Container(
      margin: EdgeInsets.all(7),
      child: ListTile(
        style: ListTileStyle.drawer,
        onTap: () {
          Get.toNamed(itemRoute);
        },
        title: Text(
          itemName,
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: dark,
          child: Icon(
            itemIcon,
            color: Colors.white,
            size: 27,
          ),
        ),
        hoverColor: Colors.red,
      ),
    );
  }
}
