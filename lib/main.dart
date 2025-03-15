import 'package:flutter/material.dart';
import 'package:prayer_times/src/views/clock_views.dart';
import 'package:prayer_times/src/views/compass/compass_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ClockViews());
  }
}
