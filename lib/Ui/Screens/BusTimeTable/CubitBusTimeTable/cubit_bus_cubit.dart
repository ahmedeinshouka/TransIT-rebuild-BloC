import 'package:bloc/bloc.dart';
import 'cubit_bus_state.dart';

class BusTimetableCubit extends Cubit<BusTimetableState> {
  BusTimetableCubit() : super(BusTimetableState());

  // Method to select a starting location
  void selectLocation(String location) {
    emit(state.copyWith(selectedLocation: location));
  }

  // Method to select a specific bus stop
  void selectBusStop(String busStop) {
    emit(state.copyWith(selectedBusStop: busStop));
  }

  // Method to trigger a refresh of the bus schedule
  void refreshBusSchedule() async {
    emit(state.copyWith(isRefreshing: true));

    // Simulate a network call or data fetching delay
    await Future.delayed(Duration(seconds: 1));

    emit(state.copyWith(isRefreshing: false, isHighlighted: true));

    // Reset the highlight after a short duration
    Future.delayed(Duration(seconds: 1), () {
      emit(state.copyWith(isHighlighted: false));
    });
  }
}
