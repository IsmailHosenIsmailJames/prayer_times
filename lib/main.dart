import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prayer_times/src/setup/app_setup_page.dart';
import 'package:prayer_times/src/theme/controller/theme_controller_getx.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      onInit: () {
        final themeControleer = Get.put(ThemeControllerGetx());
        final prefBox = Hive.box("pref");
        final int themeValue = prefBox.get("themeValue", defaultValue: 2);
        themeControleer.changeTheme(listOfThemeMode[themeValue]);
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
