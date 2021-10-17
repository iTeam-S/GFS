import 'dart:ui';

import 'package:flutter/widgets.dart';

class SpendingCategoryModel {
  final String label;
  final String image;
  final int price;
  final Color color;

  const SpendingCategoryModel(this.label, this.image, this.price, this.color);
}
