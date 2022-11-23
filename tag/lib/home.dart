import "package:flutter/material.dart";
import "package:get/get.dart";
// import 'package:analog_clock/analog_clock.dart';
import "package:one_clock/one_clock.dart";

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
      ),

      //drawer
      drawer: const Drawer(),

      //body
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.89,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: const DigitalClock(),
                ),
              ),
            ),

            //Analog Clock
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.89,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: const AnalogClock(
                    showDigitalClock: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => setAlarm(context),
          );
        },
        tooltip: "Set an alarm",
        child: const Icon(
          Icons.notification_add_outlined,
        ),
      ),
    );
  }

//SetAlarm Dialogue boc
  AlertDialog setAlarm(BuildContext context) {
    return AlertDialog(
      title: const Text("Set an Alarm"),
      content: const SingleChildScrollView(
        child: Text("Alarm"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Set"),
        )
      ],
    );
  }
}
