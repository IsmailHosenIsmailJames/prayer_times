import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControllerGetx {
  void changeTheme(ThemeMode toChange) async {
    Get.changeThemeMode(toChange);
  }
}
