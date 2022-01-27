import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff25272a),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              color: Color(0xFF3F4041),
              height: Get.height * .45,
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
                    backgroundColor: Colors.black,
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
            Container(
              child: Column(
                children: [
                  menuItems(
                      itemName: 'Jirama',
                      itemIcon: LineIcons.plug,
                      itemRoute: '/jirama',
                      itemColor: Colors.blue),
                  menuItems(
                      itemName: 'Cuisine',
                      itemIcon: LineIcons.utensils,
                      itemRoute: '/membre',
                      itemColor: Colors.purple),
                  menuItems(
                      itemName: 'Ménage',
                      itemIcon: LineIcons.couch,
                      itemRoute: '/membre',
                      itemColor: Colors.orange),
                  menuItems(
                      itemName: 'Budget',
                      itemIcon: LineIcons.coins,
                      itemRoute: '/membre',
                      itemColor: Colors.pink),
                  menuItems(
                      itemName: 'Agenda',
                      itemIcon: LineIcons.calendar,
                      itemRoute: '/agenda',
                      itemColor: Colors.amber),
                  menuItems(
                      itemName: 'Membres',
                      itemIcon: LineIcons.users,
                      itemRoute: '/membre',
                      itemColor: Colors.blue),
                  menuItems(
                      itemName: 'Deconexion',
                      itemIcon: LineIcons.alternateSignOut,
                      itemRoute: '/login',
                      itemColor: Colors.grey),
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
    required Color itemColor,
  }) {
    return ListTile(
      onTap: () {
        Get.toNamed(itemRoute);
      },
      title: Text(
        itemName,
        style: TextStyle(color: Colors.white),
      ),
      leading: CircleAvatar(
        backgroundColor: itemColor,
        child: Icon(
          itemIcon,
          color: Colors.black,
        ),
      ),
      hoverColor: Colors.red,
    );
  }
}
