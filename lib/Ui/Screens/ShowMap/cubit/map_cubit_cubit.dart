// bus_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'map_cubit_state.dart';

class BusCubit extends Cubit<BusState> {
  final List<Map<String, String>> initialBuses;

  BusCubit(this.initialBuses) : super(BusInitialState(initialBuses));

  void filterBuses(String address) {
    if (address == 'Select an address') {
      emit(BusInitialState(initialBuses));
    } else {
      final filteredList = initialBuses.where((bus) => bus['address'] == address).toList();
      emit(BusFilteredState(filteredList));
    }
  }
}
