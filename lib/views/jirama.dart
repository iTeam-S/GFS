import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/views/widgets/app_colors.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:gfs/views/widgets/spending_category_model.dart';
import 'package:gfs/views/widgets/price_text.dart';
import 'package:gfs/views/widgets/spending_category.dart';
import 'package:line_icons/line_icons.dart';

class Jirama extends StatefulWidget {
  static const categoryModels = [
    SpendingCategoryModel(
        'Janvier', 'assets/images/jirama.png', 500, AppColors.secondaryAccent),
    SpendingCategoryModel(
      'Fevrier',
      'assets/images/jirama.png',
      1500,
      AppColors.secondaryAccent,
    ),
    SpendingCategoryModel(
      'Mars',
      'assets/images/jirama.png',
      3000,
      AppColors.secondaryAccent,
    ),
    SpendingCategoryModel(
      'Avril',
      'assets/images/jirama.png',
      400,
      AppColors.secondaryAccent,
    ),
    SpendingCategoryModel(
      'Mai',
      'assets/images/jirama.png',
      2000,
      AppColors.secondaryAccent,
    ),
  ];

  @override
  _JiramaState createState() => _JiramaState();
}

AppDrawer drawer = AppDrawer();

class _JiramaState extends State<Jirama> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: drawer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff25272a),
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            LineIcons.verticalEllipsis,
          ),
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Color(0xff25272a),
        child: Column(
          children: [
            Container(
              height: Get.height * .1,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estimation\ndu mois prochain',
                            style:
                                TextStyle(color: AppColors.primaryWhiteColor),
                          ),
                          SizedBox(width: 20),
                          PriceText(
                            price: 2500,
                            color: AppColors.primaryWhiteColor,
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                          color: AppColors.secondaryAccent,
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColors.secondaryAccent),
                      // Wrap the IconButton in a Material widget for the
                      // IconButton's splash to render above the container.
                      child: Material(
                        borderRadius: BorderRadius.circular(32),
                        type: MaterialType.transparency,
                        // Hard Edge makes sure the splash is clipped at the border of this
                        // Material widget, which is circular due to the radius above.
                        clipBehavior: Clip.hardEdge,
                        child: IconButton(
                          padding: EdgeInsets.all(16),
                          color: AppColors.primaryWhiteColor,
                          iconSize: 32,
                          icon: Icon(
                            Icons.savings,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: ListView(children: [
                for (var model in Jirama.categoryModels)
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36.0, vertical: 7),
                      child: SpendingCategory(model))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
