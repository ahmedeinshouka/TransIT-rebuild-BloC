// bus_schedule_widget_cubit.dart
import 'package:bloc/bloc.dart';
import 'bus_schedule_widget_state.dart';
import 'package:untitled5/SharedData/UsedData/BusLine.dart'; // Update path as needed

class BusScheduleCubit extends Cubit<BusScheduleState> {
  BusScheduleCubit() : super(BusScheduleInitial());

  void loadBusSchedule(String location, {String? busNumber}) {
    emit(BusScheduleLoading());

    try {
      final filteredSchedules = allBusSchedules.where((schedule) {
        final matchesLocation = schedule['location'] == location;
        final matchesBusNumber = busNumber == null || schedule['busNumber'] == busNumber;
        return matchesLocation && matchesBusNumber;
      }).toList();

      Future.delayed(const Duration(seconds: 1), () {
        emit(BusScheduleLoaded(filteredSchedules));
      });
    } catch (e) {
      emit(BusScheduleError('Failed to load bus schedules.'));
    }
  }
}
