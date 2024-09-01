import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prayer_times/src/core/language/controller/language_controller.dart';
import 'package:prayer_times/src/screens/setup/app_setup_page.dart';
import 'package:prayer_times/src/theme/controller/theme_controller_getx.dart';

import 'src/core/language/translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox("pref");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade800,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData.light(useMaterial3: true).copyWith(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade800,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("en", "US"),
      translationsKeys: AppTranslation.translationsKeys,
      onInit: () {
        final themeControleer = Get.put(ThemeControllerGetx());
        final languageController = Get.put(LanguageController());
        final prefBox = Hive.box("pref");
        String? languageCode = prefBox.get("lan", defaultValue: null);
        final int themeValue = prefBox.get("themeValue", defaultValue: 2);
        themeControleer.changeTheme(listOfThemeMode[themeValue]);
        languageCode ??= Get.locale!.languageCode;
        languageController.changeLanguage = languageCode;
      },
      home: const AppSetupPage(),
    );
  }
}

List<ThemeMode> listOfThemeMode = [
  ThemeMode.light,
  ThemeMode.dark,
  ThemeMode.system
];
