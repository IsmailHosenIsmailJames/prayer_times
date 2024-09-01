import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControllerGetx {
  RxInt themeValue = 2.obs;
  void changeTheme(ThemeMode toChange) async {
    Future.delayed(const Duration(milliseconds: 100)).then(
      (value) {
        Get.changeThemeMode(toChange);
      },
    );
  }
}
