import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants.dart';

Widget cardMembre({
  required VoidCallback onPressed,
  required String name,
  required String prom,
  required String es,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: dark,
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(
              width: 1.0,
              color: Colors.white24,
            ),
          ),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.0,
              color: orange,
            ),
          ),
          child: Center(
            child: Text(
              "P$prom",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            LineIcons.graduationCap,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "$es",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.delete_forever,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    ),
  );
}
