import 'package:flutter/material.dart';
import 'package:untitled5/consts/Colors.dart';
import 'package:untitled5/ReusedWidets/TransItBottomImg/BottomImage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColorBase,
        body: Stack(
          children: [
            // Positioned for the top image banner
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 400,
                height: 240,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/HomeMaterial/img3.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Positioned for the Row of GestureDetector items
            Positioned(
              top: 200,
              left: 35,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/BusTimetable');
                    },
                    child: Material(
                      elevation: 6, // Elevation for shadow effect
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: appColorBase,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 150,
                          height: 150,
                          child: const Stack(
                            children: [
                              Positioned(
                                left: 15,
                                top: 33,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus,
                                      size: 30,
                                      color: bottomColorRedWhite,
                                    ),
                                    Text(
                                      "Bus Timetable",
                                      style: TextStyle(
                                        color: bottomColorRedWhite,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Know When",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "The Bus Will Arrive",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned Icon corrected to fit inside Stack
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                              Positioned(
                                right: -15,
                                top: -15,
                                child: CircleAvatar(
                                  backgroundColor: bottomColorRedWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/showmap');
                    },
                    child: Material(
                      elevation: 6, // Elevation for shadow effect
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: appColorBase,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 150,
                          height: 150,
                          child: const Stack(
                            children: [
                              Positioned(
                                left: -15,
                                top: -15,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(204, 139, 0, 110),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 33,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus,
                                      size: 30,
                                      color: Color.fromRGBO(204, 139, 0, 110),
                                    ),
                                    Text(
                                      "Show Map",
                                      style: TextStyle(
                                        color: Color.fromRGBO(204, 139, 0, 110),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Show The Bus",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Roadmap To Know Your Track",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned for the bottom image
            ImageFotter(),
          ],
        ),
      ),
    );
  }
}
