import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'package:gfs/models/categorie/model.categorie.plat.dart';
import 'package:gfs/persistData/data.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String commentaire;
  final String prix;
  final String categorie;
  final List<String> ingredient;
  final bool isHome;
  const RecipeCard({
    Key? key,
    required this.title,
    required this.commentaire,
    required this.prix,
    required this.categorie,
    required this.ingredient,
    required this.isHome,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  final DataApp _data = DataApp();

  List<PlatModel> categorie(String nom) {
    return _data.categoriePlat
        .where(
          (element) => element.name.toLowerCase() == nom.toLowerCase(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: categorie(widget.categorie)[0].couleur,
          )),
      // height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: widget.isHome
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: categorie(widget.categorie)[0].couleur,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * .6,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.5),
                      radius: 25,
                      child: Icon(
                        categorie(widget.categorie)[0].icon,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  'Commentaire :',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.commentaire,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  'Compositions :',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: (40 * widget.ingredient.length).toDouble(),
                child: ListView.builder(
                  itemCount: widget.ingredient.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ListTile(
                        leading: Text(
                          widget.ingredient[index],
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Text(
                          "+",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: categorie(widget.categorie)[0].couleur,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LineIcons.utensils,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        widget.categorie + ' ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: categorie(widget.categorie)[0].couleur,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LineIcons.coins,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        widget.prix + ' Ar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
