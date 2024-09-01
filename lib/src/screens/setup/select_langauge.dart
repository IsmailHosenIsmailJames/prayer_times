import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:prayer_times/src/core/language/controller/language_controller.dart';
import 'package:prayer_times/src/core/language/translation.dart';
import 'package:prayer_times/src/screens/setup/location_setup/allow_location_access.dart';
import 'package:prayer_times/src/widgets/theme_change_button.dart';

class SelectLangauge extends StatefulWidget {
  const SelectLangauge({super.key});

  @override
  State<SelectLangauge> createState() => _SelectLangaugeState();
}

class _SelectLangaugeState extends State<SelectLangauge> {
  late int selectedIndex;
  final languageController = Get.put(LanguageController());
  @override
  void initState() {
    final prefBox = Hive.box("pref");
    String? languageCode = prefBox.get("lan", defaultValue: null);

    languageCode ??= Get.locale!.languageCode;
    List supportedLanguageCode = supportedLanguage.values.toList();
    for (int i = 0; i < supportedLanguageCode.length; i++) {
      if (supportedLanguageCode[i] == languageCode) {
        selectedIndex = i;
        break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.offAll(() => const AllowLocationAccess());
        },
        label: Row(
          children: [
            Text(
              "Next".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(5),
            const Icon(
              Icons.arrow_forward_rounded,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select a language".tr),
        actions: [getThemeChangeIconButton()],
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 100, top: 10),
        itemCount: supportedLanguage.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              String languageCode = supportedLanguage.values.toList()[index];
              languageController.changeLanguage = languageCode;
              final box = Hive.box("pref");
              box.put("lan", languageCode);
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  selectedIndex == index
                      ? Icon(
                          Icons.radio_button_checked,
                          color: Colors.green.shade600,
                        )
                      : Icon(
                          Icons.radio_button_off,
                          color: Colors.grey.shade700,
                        ),
                  const Gap(20),
                  Text(
                    nativeSpelling[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
