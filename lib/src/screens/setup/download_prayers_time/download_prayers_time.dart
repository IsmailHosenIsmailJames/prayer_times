import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadPrayersTime extends StatefulWidget {
  final double lat;
  final double lon;
  final String city;
  final String country;

  const DownloadPrayersTime({
    super.key,
    required this.lat,
    required this.lon,
    required this.city,
    required this.country,
  });

  @override
  State<DownloadPrayersTime> createState() => _DownloadPrayersTimeState();
}

class _DownloadPrayersTimeState extends State<DownloadPrayersTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
