import 'package:analog_clock/analog_clock.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";

import 'widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tag",
          style: TextStyle(
            fontFamily: "Orlande",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.lightbulb),
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(Themes.lightMode)
                    : Get.changeTheme(Themes.darkMode);
              })
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ),

      //body
      body: const AnalogClock(
        showDigitalClock: false,
        showAllNumbers: true,
        useMilitaryTime: true,
        // datetime: DateTime(year),
        hourHandColor: Colors.blue,
      ),

      //floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.back_hand),
      ),
    );
  }
}
