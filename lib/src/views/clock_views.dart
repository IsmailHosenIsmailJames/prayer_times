import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClockViews extends StatefulWidget {
  const ClockViews({super.key});

  @override
  State<ClockViews> createState() => _ClockViewsState();
}

class _ClockViewsState extends State<ClockViews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: size.width - 24,
            height: size.width - 24,
            child: SvgPicture.asset(
              'assets/clock_earth.svg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
