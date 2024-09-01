import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class ManualSetupLocation extends StatefulWidget {
  const ManualSetupLocation({super.key});

  @override
  State<ManualSetupLocation> createState() => _ManualSetupLocationState();
}

class _ManualSetupLocationState extends State<ManualSetupLocation> {
  List listOfCity = [];
  @override
  void initState() {
    rootBundle.loadString("assets/cities.json").then(
      (value) {
        Map<String, dynamic> decodedJasonData =
            Map<String, dynamic>.from(jsonDecode(value));
        setState(() {
          listOfCity = List<dynamic>.from(decodedJasonData['citiys']);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual Location Setup"),
      ),
      body: Column(
        children: [
          TextFormField(),
          Expanded(
            child: listOfCity.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: listOfCity.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue.shade100,
                        padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(listOfCity[index][0].toString()),
                              const Gap(10),
                              Text(listOfCity[index][1].toString()),
                              const Gap(10),
                              Text(listOfCity[index][2].toString()),
                              const Gap(10),
                              Text(listOfCity[index][3].toString()),
                              const Gap(10),
                              Text(listOfCity[index][4].toString()),
                              const Gap(10),
                              Text(listOfCity[index][5].toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
