import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFFFF8C2D),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              color: Color(0xFFFF8C2D),
              height: Get.height * .3,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Get.toNamed('/'),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          LineIcons.home,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
                          "Dominick Randriamanantena",
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
              color: Colors.white,
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
                    itemRoute: '/membre',
                  ),
                  menuItems(
                    itemName: 'Ménage',
                    itemIcon: LineIcons.couch,
                    itemRoute: '/membre',
                  ),
                  menuItems(
                    itemName: 'Budget',
                    itemIcon: LineIcons.coins,
                    itemRoute: '/membre',
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
                  menuItems(
                    itemName: 'Deconexion',
                    itemIcon: LineIcons.alternateSignOut,
                    itemRoute: '/login',
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
    return ListTile(
      onTap: () {
        Get.toNamed(itemRoute);
      },
      title: Text(
        itemName,
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      leading: CircleAvatar(
        backgroundColor: Color(0xFF000000),
        child: Icon(itemIcon, color: Colors.white),
      ),
      hoverColor: Colors.red,
    );
  }
}
