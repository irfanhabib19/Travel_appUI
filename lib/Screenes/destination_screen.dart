import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_appui/models/activity_models.dart';
import 'package:travel_appui/models/destination_models.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({required this.destination});
  @override
  State<DestinationScreen> createState() => DestinationScreenState();
}

class DestinationScreenState extends State<DestinationScreen> {
  Text _buildratingstar(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(widget.destination.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      )),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.sortAmountDown,
                          size: 30,
                          color: Colors.black,
                        )),
                  ],
                )
              ],
            ),
            Positioned(
              top: 300,
              bottom: 10,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 252, 252)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 13.0,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.destination.country,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  size: 25,
                  color: Colors.white70,
                )),
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity acti = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 244, 239, 239),
                          borderRadius: BorderRadius.circular(21)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    acti.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '\$${acti.price}',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'per day',
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(acti.type),
                            _buildratingstar(acti.rating),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: const Color.fromARGB(
                                          255, 112, 222, 237)),
                                  child: Center(child: Text(acti.startTime[0])),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: const Color.fromARGB(
                                          255, 129, 232, 234)),
                                  child: Center(child: Text(acti.startTime[1])),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
