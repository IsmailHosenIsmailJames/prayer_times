import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:prayer_times/main.dart';

import '../theme/controller/theme_controller_getx.dart';

Widget getThemeChangeIconButton([ButtonStyle? buttonStyle]) {
  final themeControllerGetx = Get.put(ThemeControllerGetx());

  return IconButton(
    style: buttonStyle,
    onPressed: () async {
      final prefBox = Hive.box("pref");
      int themeValue = prefBox.get("themeValue", defaultValue: 2);
      themeValue = (themeValue + 1) % 3;
      themeControllerGetx.changeTheme(listOfThemeMode[themeValue]);
      themeControllerGetx.themeValue.value = themeValue;
      await prefBox.put("themeValue", themeValue);
    },
    icon: Obx(
      () {
        return Icon([
          Icons.light_mode_rounded,
          Icons.dark_mode_rounded,
          Icons.brightness_6_rounded,
        ][themeControllerGetx.themeValue.value]);
      },
    ),
  );
}
