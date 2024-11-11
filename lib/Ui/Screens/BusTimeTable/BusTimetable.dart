import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CubitBusTimeTable/cubit_bus_cubit.dart';
import 'CubitBusTimeTable/cubit_bus_state.dart';
import 'package:untitled5/consts/Colors.dart'; // Adjust as needed
import 'package:untitled5/ReusedWidets/BusScheduleWidget/BusScheduleWidget.dart'; // Adjust as needed

class BusTimetable extends StatelessWidget {
  final List<String> busStops = [
    'W1_01',
    'W1_02',
    'W1_03',
    'W1_04',
    'W1_05',
    'W1_06'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusTimetableCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appColorBase,
          body: BlocBuilder<BusTimetableCubit, BusTimetableState>(
            builder: (context, state) {
              final cubit = context.read<BusTimetableCubit>();

              return Stack(
                children: [
                  Positioned(
                    top: 5,
                    left: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Positioned(
                    top: 61,
                    left: 24,
                    right: 24,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bus Timetable",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                              color: bottomColorRedWhite,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Showing bus time schedule",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Starting Locations",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  cubit.selectLocation('Sheraton');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    state.selectedLocation == 'Sheraton'
                                        ? bottomColorRedWhite
                                        : bottomColorRedWhite40,
                                  ),
                                ),
                                child: const Text(
                                  "Sheraton",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  cubit.selectLocation('Al-Manarah');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    state.selectedLocation == 'Al-Manarah'
                                        ? bottomColorRedWhite
                                        : bottomColorRedWhite40,
                                  ),
                                ),
                                child: const Text(
                                  "Al-Manarah",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Bus Timeline",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconButton(
                                    onPressed: cubit.refreshBusSchedule,
                                    icon: Icon(
                                      Icons.refresh,
                                      color: state.isHighlighted
                                          ? bottomColorRedWhite
                                          : Colors.grey,
                                    ),
                                  ),
                                  if (state.isRefreshing)
                                    const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(busStops.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        cubit.selectBusStop(busStops[index]);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: state.selectedBusStop == busStops[index]
                                            ? bottomColorRedWhite
                                            : bottomColorRedWhite40,
                                      ),
                                      child: Text(
                                        busStops[index],
                                        style: TextStyle(
                                          color: state.selectedBusStop == busStops[index]
                                              ? Colors.white
                                              : bottomColorRedWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 400,
                            child: BusScheduleWidget(
                              location: state.selectedLocation, // Pass the location argument
                              selectedBusStop: state.selectedBusStop,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/HomeMaterial/img2.jpg",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
