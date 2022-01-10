import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

showLongSnackbar(String title, String body) {
  Get.snackbar(title, body,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 7),
      backgroundColor: Colors.black);
}

showShortSnackbar(String title, String body) {
  Get.snackbar(title, body,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black);
}

showMessageSnackbar(String? message) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: const Duration(milliseconds: 3000),
  ));
}


setupLightStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
}