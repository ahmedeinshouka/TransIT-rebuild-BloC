import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bus_schedule_widget_cubit.dart';
import 'cubit/bus_schedule_widget_state.dart';
import 'package:untitled5/consts/Colors.dart';

class BusScheduleWidget extends StatelessWidget {
  final String location;
  final String selectedBusStop;

  BusScheduleWidget({required this.location, required this.selectedBusStop});

  @override
  Widget build(BuildContext context) {
    context.read<BusScheduleCubit>().loadBusSchedule(location, busNumber: selectedBusStop);

    return BlocBuilder<BusScheduleCubit, BusScheduleState>(
      builder: (context, state) {
        if (state is BusScheduleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BusScheduleLoaded) {
          final scheduleList = state.busSchedule;
          if (scheduleList.isEmpty) {
            return Center(
              child: Text('No schedule available for $location', style: const TextStyle(color: Colors.grey, fontSize: 16)),
            );
          }
          return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: scheduleList.length,
              itemBuilder: (context, index) {
                final schedule = scheduleList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                              color: bottomColorRedWhite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              schedule['time']!,
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Bus Number', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  Text(schedule['busNumber']!, style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Bus Type', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  Text(schedule['busType']!, style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Available Seats', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  Text(schedule['availableSeats']!, style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is BusScheduleError) {
          return Center(
            child: Text(state.message, style: const TextStyle(color: Colors.red, fontSize: 16)),
          );
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}
