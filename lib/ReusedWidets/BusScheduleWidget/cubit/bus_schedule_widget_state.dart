import 'package:equatable/equatable.dart';

// Base state class
abstract class BusScheduleState extends Equatable {
  @override
  List<Object> get props => [];
}

// Initial state when the app starts or data is not loaded yet
class BusScheduleInitial extends BusScheduleState {}

// Loading state to show when data is being loaded
class BusScheduleLoading extends BusScheduleState {}

// Loaded state that holds the filtered bus schedule
class BusScheduleLoaded extends BusScheduleState {
  final List<Map<String, String>> busSchedule;

  BusScheduleLoaded(this.busSchedule);

  @override
  List<Object> get props => [busSchedule];
}

// Error state if something goes wrong
class BusScheduleError extends BusScheduleState {
  final String message;

  BusScheduleError(this.message);

  @override
  List<Object> get props => [message];
}
