import 'package:flutter/material.dart';
import 'package:gfs/views/widgets/card_cuisto.dart';
// ignore: unused_import
import 'package:line_icons/line_icons.dart';

class TacheCuisine extends StatefulWidget {
  const TacheCuisine({Key? key}) : super(key: key);

  @override
  _TacheCuisineState createState() => _TacheCuisineState();
}

class _TacheCuisineState extends State<TacheCuisine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          child: ListView(
        children: [
          RecipeCard(
              title: 'Ravinkazaha',
              groupe: 'Groupe1',
              heureCuisto: '07h30',
              thumbnailUrl:
                  'https://stileex.xyz/wp-content/uploads/2018/10/image-principale-2.jpg')
        ],
      )),
    );
  }
}
