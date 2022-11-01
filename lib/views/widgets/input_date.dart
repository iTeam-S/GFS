import 'package:flutter/material.dart';

Widget dataWidget({
  required TextEditingController controller,
  required double width,
  required String hintText,
}) {
  return Container(
    margin: EdgeInsets.only(
      left: 15,
    ),
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 50,
    width: width,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: TextInputType.number,
      maxLines: 1,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 17,
          color: Colors.black26,
          fontWeight: FontWeight.normal,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}
