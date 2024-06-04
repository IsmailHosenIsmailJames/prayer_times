import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_times/src/home/clock/clock.dart';
import 'package:prayer_times/src/theme/controller/theme_controller_getx.dart';
import 'package:prayer_times/src/widgets/theme_change_button.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final themeControllerGetx = Get.put(ThemeControllerGetx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(child: getThemeChangeIconButton()),
      ),
      appBar: AppBar(),
      body: Stack(
        children: [
          const RiveAnimation.asset("assets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                alignment: Alignment.center,
                color: const Color(0xFF292B3F).withOpacity(0.5),
                child: const ClockView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
