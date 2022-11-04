import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMe(String titre, String message, Color coleur) {
  Get.snackbar(
    titre,
    message,
    colorText: Colors.white,
    backgroundColor: coleur,
    snackPosition: SnackPosition.TOP,
    borderColor: coleur,
    borderRadius: 10,
    borderWidth: 2,
    barBlur: 0,
    duration: const Duration(seconds: 2),
  );
}
