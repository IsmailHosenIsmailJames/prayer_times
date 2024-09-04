import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

class DownloadPrayersTime extends StatefulWidget {
  final double? lat;
  final double? lon;
  final String? city;
  final String? country;

  const DownloadPrayersTime({
    super.key,
    this.lat,
    this.lon,
    this.city,
    this.country,
  });

  @override
  State<DownloadPrayersTime> createState() => _DownloadPrayersTimeState();
}

class _DownloadPrayersTimeState extends State<DownloadPrayersTime> {
  @override
  void initState() {
    downloadPrayerTime();
    super.initState();
  }

  Future<void> downloadPrayerTime() async {
    if (widget.lat != null &&
        widget.lon != null &&
        widget.city != null &&
        widget.country != null) {
      final box = Hive.box("pref");
      box.put("country", widget.country);
      box.put("city", widget.city);
      box.put("lat", widget.lat);
      box.put("lon", widget.lon);

      //TODO
    } else {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      );

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      String? country;
      String? city;
      for (Placemark placemark in placemarks) {
        if (placemark.subAdministrativeArea != null) {
          city = placemark.subAdministrativeArea;
        }
        if (placemark.country != null) {
          country = placemark.country;
        }
      }
      if (country != null && city != null) {
        final box = Hive.box("pref");
        box.put("country", country);
        box.put("city", city);
        box.put("lat", position.latitude);
        box.put("lon", position.longitude);
        // TODO
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(widget.city ?? ""),
          Text(widget.country ?? ""),
          Text(widget.lat.toString()),
          Text(widget.lon.toString()),
        ],
      ),
    );
  }
}
