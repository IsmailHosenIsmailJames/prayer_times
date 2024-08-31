import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:prayer_times/src/setup/select_langauge.dart';
import 'package:simple_icons/simple_icons.dart';

class AllowLocationAccess extends StatefulWidget {
  const AllowLocationAccess({super.key});

  @override
  State<AllowLocationAccess> createState() => _AllowLocationAccessState();
}

class _AllowLocationAccessState extends State<AllowLocationAccess> {
  String? accestStatusText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => const SelectLangauge(),
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.4),
                    Colors.blue.withOpacity(0.1),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/allow_location.png'),
                ),
              ),
            ),
          ),
          const Gap(20),
          Text(
            'Allow Background Location Access'.tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "We must need location data for running this app with essential features. Please allow location access, then you can go next step."
                  .tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const Gap(30),
          ElevatedButton.icon(
            onPressed: () async {
              final serviceEnabled =
                  await Geolocator.isLocationServiceEnabled();

              if (!serviceEnabled) {
                return;
              }

              var status = await Geolocator.checkPermission();

              if (status == LocationPermission.denied) {
                status = await Geolocator.requestPermission();
              }
              if (status == LocationPermission.whileInUse ||
                  status == LocationPermission.always) {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'You did allow location access',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
              } else if (status == LocationPermission.denied) {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'You denied location access',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
                setState(() {
                  accestStatusText = 'You denied location access';
                });
              } else if (status == LocationPermission.deniedForever) {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'You permanently denied location access',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
                setState(() {
                  accestStatusText = 'You permanently denied location acces';
                });
              } else {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'Something Went Worng!',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
                setState(() {
                  accestStatusText = 'Something Went Worng!';
                });
              }
            },
            label: Text(
              'Allow Background Location Access'.tr,
            ),
            icon: const Icon(
              SimpleIcons.googlemaps,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  thickness: 2,
                ),
              ),
              const Gap(15),
              Text(
                "Or".tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade700,
                ),
              ),
              const Gap(15),
              const Expanded(
                child: Divider(
                  thickness: 2,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final serviceEnabled =
                  await Geolocator.isLocationServiceEnabled();

              if (!serviceEnabled) {
                return;
              }

              var status = await Geolocator.checkPermission();

              if (status == LocationPermission.denied) {
                status = await Geolocator.requestPermission();
              }
              if (status == LocationPermission.whileInUse ||
                  status == LocationPermission.always) {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'You did allow location access',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
              } else if (status == LocationPermission.denied) {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'You denied location access',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
                setState(() {
                  accestStatusText = 'You denied location access';
                });
              } else if (status == LocationPermission.deniedForever) {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'You permanently denied location access',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
                setState(() {
                  accestStatusText = 'You permanently denied location acces';
                });
              } else {
                unawaited(
                  Fluttertoast.showToast(
                    msg: 'Something Went Worng!',
                    toastLength: Toast.LENGTH_LONG,
                  ),
                );
                setState(() {
                  accestStatusText = 'Something Went Worng!';
                });
              }
            },
            label: Text(
              'Setup Manually'.tr,
            ),
            icon: const Icon(
              SimpleIcons.googlemaps,
            ),
          ),
          const Gap(30),
          Text(accestStatusText ?? ''),
          if (accestStatusText != null)
            Text(
              'Go to app settings and allow all the time location access'.tr,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
