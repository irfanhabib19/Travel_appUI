import 'package:flutter/material.dart';
import 'package:travel_appui/models/destination_models.dart';

class Destinationcursor extends StatelessWidget {
  Destinationcursor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Destination",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.black),
              ),
              Text(
                "See All ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 111, 214, 239)),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          color: const Color.fromARGB(255, 11, 135, 236),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext, index) {
                Destination desti = destinations[index];
                return Container(
                    margin: EdgeInsets.all(10.0),
                    child: Container(
                      width: 210,
                      color: Colors.red,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 120,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${desti.activities.length} activities',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '${desti.description}',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
              }),
        )
      ],
    );
  }
}
