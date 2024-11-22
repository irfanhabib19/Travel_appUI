import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_appui/widgets/destinationCursor.dart';
import 'package:travel_appui/widgets/hotelCursor.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<Homescreen> {
  int currentTab = 0;
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking
  ];
  Widget iconBuilder(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 200, 223, 228)
              : Color(0xffe7ebee),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 30,
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 67, 189, 192)
              : Color.fromARGB(255, 167, 194, 215),
        ),
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
                  .toList()),
          Destinationcursor(),
          SizedBox(
            height: 15,
          ),
          Hotelcursor(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTab,
          onTap: (int value) {
            setState(() {
              currentTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: " search "),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  size: 30,
                ),
                label: 'explore'),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://www.pixelstalk.net/wp-content/uploads/2016/08/Cute-girls-hd-images.jpg'),
                ),
                label: "profile "),
          ]),
    );
  }
}
