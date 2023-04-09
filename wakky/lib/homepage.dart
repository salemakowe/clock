import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff646e82),
            Color(0xffffff),
            Color(0xe9edf0),
            Color(0xa6b4c8)
          ],
        )),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              //olor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
