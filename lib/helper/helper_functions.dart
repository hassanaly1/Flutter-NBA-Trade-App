import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/text.dart';

class AppHelperFunctions {
  static void showSnackBar({required String message, Color? backgroundColor}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: CustomTextWidget(
            text: message,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            textColor: Colors.black54),
        showCloseIcon: true,
        closeIconColor: Colors.black54,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
