import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: CustomClockCanvas(now: DateTime.now()),
      ),
    );
  }
}

class CustomClockCanvas extends CustomPainter {
  final DateTime now;
  CustomClockCanvas({required this.now});
  @override
  void paint(Canvas canvas, Size size) async {
    int hoursAngle = (now.hour * 30 + now.minute * 0.5).round();
    int minutesAngel = (now.minute * 6 + now.second * 0.1).round();
    int secondsAngle = now.second * 6;

    double x = size.height;
    double y = size.width;
    double centerX = x / 2;
    double centerY = y / 2;
    double radius = min(centerY, centerX);
    final center = Offset(centerX, centerY);

    Paint fillPaint = Paint()..color = const Color(0xFF424775);

    Paint outLinePaint = Paint()
      ..color = const Color(0xFFEBEDFF)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    Paint centerCirclePaint = Paint()..color = const Color(0xFFEBEDFF);

    Paint hoursPaint = Paint()
      ..color = const Color(0xFFEBEDFF)
      ..shader = const RadialGradient(
        colors: [
          Color(0xffC47AFB),
          Color(0xFFEC75A9),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    Paint minutesPaint = Paint()
      ..color = const Color(0xFFEBEDFF)
      ..shader = const RadialGradient(
        colors: [
          Color(0xFF6D83EA),
          Color(0xFF78DEFF),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    Paint secPaint = Paint()
      ..color = const Color(0xFFEBEDFF)
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFFCAC77),
          Color(0xFFFFCB78),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    double hourX = centerX +
        (x * 0.2) *
            sin(((pi * (360 - ((hoursAngle + 180) % 360)).abs()) / 180));
    double hourY = centerY +
        (y * 0.2) *
            cos(((pi * (360 - ((hoursAngle + 180) % 360)).abs()) / 180));

    double minutesX = centerX +
        (x * 0.3) *
            sin(((pi * (360 - ((minutesAngel + 180) % 360)).abs()) / 180));
    double minutesY = centerY +
        (y * 0.3) *
            cos(((pi * (360 - ((minutesAngel + 180) % 360)).abs()) / 180));

    double secX = centerX +
        (x * 0.35) *
            sin(((pi * (360 - ((secondsAngle + 180) % 360)).abs()) / 180));
    double secY = centerY +
        (y * 0.35) *
            cos(((pi * (360 - ((secondsAngle + 180) % 360)).abs()) / 180));

    canvas.drawCircle(center, radius - 25, fillPaint);
    canvas.drawCircle(center, radius - 22.5, outLinePaint);
    canvas.drawLine(center, Offset(hourX, hourY), hoursPaint);
    canvas.drawLine(center, Offset(minutesX, minutesY), minutesPaint);
    canvas.drawLine(center, Offset(secX, secY), secPaint);
    canvas.drawCircle(center, 10, centerCirclePaint);

    Paint drawAllMinHourLines = Paint();

    for (int x = 0; x < 360; x++) {
      int i = (360 - ((x + 180) % 360)).abs();
      if (i % 6 == 0 || i % 30 == 0) {
        double x = centerX + radius * sin(((pi * i) / 180));
        double y = centerY + radius * cos(((pi * i) / 180));
        double xExtend = centerX + (radius + 15) * sin(((pi * i) / 180));
        double yExtend = centerY + (radius + 15) * cos(((pi * i) / 180));

        drawAllMinHourLines = Paint()
          ..color = const Color(0xFFEBEDFF)
          ..strokeWidth = i % 30 == 0 ? 5 : 2
          ..strokeCap = StrokeCap.round;
        canvas.drawLine(
            Offset(x, y), Offset(xExtend, yExtend), drawAllMinHourLines);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
