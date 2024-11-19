import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<Homescreen> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking
  ];
  Widget iconBuilder(int index) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 200, 223, 228),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        _icons[index],
        size: 30,
        color: const Color.fromARGB(255, 67, 189, 192),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(padding: EdgeInsets.symmetric(vertical: 30), children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 120),
          child: Text(
            "what would you like to find ?",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => iconBuilder(map.key))
                .toList())
      ]),
    ));
  }
}
