import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController getSnackBar({
  required String message,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  int duration = 2,
}) {
  return Get.snackbar(
    '',
    '',
    snackPosition: snackPosition,
    titleText: Text(
      message,
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: duration),
    messageText: const SizedBox(),
    // colorText: LightTheme.white,
    // backgroundColor: LightTheme.primaryTextColor.withOpacity(0.7),
  );
}
