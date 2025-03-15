import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompassView extends StatefulWidget {
  const CompassView({super.key});

  @override
  State<CompassView> createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
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
            child: SvgPicture.asset('assets/compass.svg', fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
