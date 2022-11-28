// ignore_for_file: cancel_subscriptions

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_icons/line_icons.dart';

import '../../constants.dart';
import '../../database/db.service.dart';
import 'snack_bar.dart';

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
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              height: 200,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/gfs.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: dark.withOpacity(.2),
              height: 1,
              thickness: 1,
            ),
            Container(
              child: Column(
                children: [
                  menuItems(
                    itemName: 'Acceuil',
                    itemIcon: LineIcons.home,
                    isSelected: selectedIndex == 0,
                    voidCallback: () {
                      Get.offAllNamed('/home');
                      setState(
                        () {
                          selectedIndex = 0;
                        },
                      );
                    },
                  ),
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
                      Get.offAllNamed('/menage');
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
                      if (Boxes.getEmplacement().isNotEmpty &&
                          Boxes.getGroupe().isNotEmpty) {
                        Get.offAllNamed('/agenda');
                        setState(
                          () {
                            selectedIndex = 5;
                          },
                        );
                      } else {
                        showMe(
                          "ALERT",
                          "IL VOUS FAUT D'ABORD CRÉER AU MOINS UN GROUPE ET AJOUTER UNE TACHE avant d'ouvrir l'agenda !",
                          Colors.black,
                        );
                      }
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
            ),
            Divider(
              color: dark.withOpacity(.2),
              height: 1,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "application developed by DOMINICK R.G \nfrom ",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'iTeam-\$ community',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    TextSpan(
                      text: ' .',
                    ),
                  ],
                ),
              ),
            ),
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
      color: isSelected ? orange.withOpacity(.5) : Colors.transparent,
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
            color: Colors.black,
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
