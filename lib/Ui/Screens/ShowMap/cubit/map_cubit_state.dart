// bus_state.dart
abstract class BusState {}

class BusInitialState extends BusState {
  final List<Map<String, String>> buses;
  BusInitialState(this.buses);
}

class BusFilteredState extends BusState {
  final List<Map<String, String>> filteredBuses;
  BusFilteredState(this.filteredBuses);
}
