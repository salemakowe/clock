import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:one_clock/one_clock.dart";
import 'package:tag/widgets/alarm.dart';

import 'widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Light and Dark mode Icon
bool iconBool = false;

IconData iconLight = Icons.light_mode;
IconData iconDark = Icons.dark_mode;

//LightTheme Data
ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue,
);

//DarkTheme Data
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.white,
    ),
  ),
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: iconBool ? darkTheme : lightTheme,
      home: Scaffold(
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
              icon: Icon(iconBool ? iconDark : iconLight),
              onPressed: () {
                setState(() {
                  iconBool = !iconBool;
                });
              },
            ),
          ],
        ),

        //drawer
        drawer: const Drawer(),

        //body
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const DigitalClock(
                      textScaleFactor: 2.30,
                      // digitalClockTextColor: iconBool ? darkTheme : lightTheme,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                //Analog Clock
                Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const AnalogClock(
                      showDigitalClock: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //floating action button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SetAlarm(),
            );
          },
          tooltip: "Set an alarm",
          child: const Icon(
            Icons.notification_add_outlined,
          ),
        ),
      ),
    );
  }
}
