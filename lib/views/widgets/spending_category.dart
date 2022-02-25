import 'package:flutter/material.dart';
import 'package:gfs/views/widgets/app_colors.dart';
import 'package:gfs/views/widgets/spending_category_model.dart';
import 'package:gfs/views/widgets/custom_icon_button.dart';
import 'package:gfs/views/widgets/price_text.dart';

class SpendingCategory extends StatelessWidget {
  final SpendingCategoryModel data;

  SpendingCategory(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Stack(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.white
                    : AppColors.darkModeCardColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 32, color: Colors.black45, spreadRadius: -8)
                ],
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(data.image, width: 64),
                PriceText(price: data.price),
                Row(children: [
                  (data.price <= 500)
                      ? CustomIconButton(
                          iconColor: Colors.blue, icon: Icons.done_outline)
                      : CustomIconButton(
                          iconColor: Colors.red, icon: Icons.warning_amber),
                ])
              ],
            ),
          ),
          Container(
            width: 132,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
            decoration: BoxDecoration(
              color: data.color,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Text(
              data.label,
              style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.white
                      : AppColors.darkModeCategoryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
