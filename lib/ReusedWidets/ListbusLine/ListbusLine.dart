import 'package:flutter/material.dart';
import 'package:untitled5/ReusedWidets/CustomDashLine/CustomDashLine.dart';
import 'package:untitled5/consts/Colors.dart';

class BusLinesList extends StatelessWidget {
  final List<Map<String, String>> filteredBuses;

  const BusLinesList({super.key, required this.filteredBuses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: filteredBuses.map((bus) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 5, 16),
          child: Row(
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(120, 120, 120, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_bus, color: appColorBase),
                      Text(bus['busNumber']!,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: appColorBase)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 264,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                      color: appColorBase,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(bus['stationName']!,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                DashedLine(),
                                Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(bus['departureTime']!,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 42,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(bus['agencyimg']!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
