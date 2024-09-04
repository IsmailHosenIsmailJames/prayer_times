import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:prayer_times/src/screens/setup/download_prayers_time/download_prayers_time.dart';

class ManualSetupLocation extends StatefulWidget {
  const ManualSetupLocation({super.key});

  @override
  State<ManualSetupLocation> createState() => _ManualSetupLocationState();
}

class _ManualSetupLocationState extends State<ManualSetupLocation> {
  List listOfCity = [];
  List listOfCityConst = [];
  @override
  void initState() {
    rootBundle.loadString("assets/cities.json").then(
      (value) {
        Map<String, dynamic> decodedJasonData =
            Map<String, dynamic>.from(jsonDecode(value));
        setState(() {
          listOfCity = List<dynamic>.from(decodedJasonData['citiys']);
          listOfCityConst = listOfCity;
        });
      },
    );
    super.initState();
  }

  void onSelectCity(List city) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Selected location is ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(5),
                const Divider(),
                const Gap(5),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "City: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      city[0],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Lat: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      city[1],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Lon: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      city[2],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Country: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      city[3],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const Divider(),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {},
                      label: const Text("Cancel"),
                      icon: const Icon(Icons.close),
                    ),
                    const Gap(20),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.to(
                          () => DownloadPrayersTime(
                            lat: double.parse(city[1]),
                            lon: double.parse(city[2]),
                            city: city[0],
                            country: city[3],
                          ),
                        );
                      },
                      label: const Text("  Ok  "),
                      icon: const Icon(Icons.done),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual Location Setup"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: CupertinoSearchTextField(
              onChanged: (value) {
                List tem = [];
                for (int i = 0; i < listOfCityConst.length; i++) {
                  if (listOfCityConst[i]
                      .toString()
                      .toLowerCase()
                      .contains(value.toLowerCase())) {
                    tem.add(listOfCityConst[i]);
                  }
                }
                setState(() {
                  listOfCity = tem;
                });
              },
            ),
          ),
          Expanded(
            child: listOfCity.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const Gap(20),
                      Row(
                        children: [
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 7, bottom: 7, left: 3, right: 3),
                            width: width / 4.2,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                            child: const Text(
                              "City",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 7, bottom: 7, left: 3, right: 3),
                            width: width / 4.2,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                            ),
                            child: const Text(
                              "Lan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 7, bottom: 7, left: 3, right: 3),
                            width: width / 4.2,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                            ),
                            child: const Text(
                              "Lng",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 7, bottom: 7, left: 3, right: 3),
                            width: width / 4.2,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10))),
                            child: const Text(
                              "Country",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          itemCount: listOfCity.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                onSelectCity(List.from(listOfCity[index]));
                              },
                              child: Row(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 2, right: 2),
                                      width: width / 4.2,
                                      decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? Colors.purple.shade100
                                            : Colors.blue.shade100,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          listOfCity[index][0].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 2, right: 2),
                                      width: width / 4.2,
                                      decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? Colors.purple.shade100
                                            : Colors.blue.shade100,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          listOfCity[index][1].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 2, right: 2),
                                      width: width / 4.2,
                                      decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? Colors.purple.shade100
                                            : Colors.blue.shade100,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          listOfCity[index][2].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 2, right: 2),
                                      width: width / 4.2,
                                      decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? Colors.purple.shade100
                                            : Colors.blue.shade100,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          listOfCity[index][3].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
