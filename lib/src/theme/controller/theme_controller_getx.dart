import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControllerGetx {
  RxInt themeValue = 2.obs;
  void changeTheme(ThemeMode toChange) async {
    Get.changeThemeMode(toChange);
  }
}
