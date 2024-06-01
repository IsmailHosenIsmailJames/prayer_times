import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prayer_times/src/home/clock/clock.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
