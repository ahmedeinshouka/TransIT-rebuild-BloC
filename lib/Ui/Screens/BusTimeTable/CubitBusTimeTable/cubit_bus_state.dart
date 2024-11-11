import 'package:equatable/equatable.dart';

class BusTimetableState extends Equatable {
  final String selectedLocation;
  final String selectedBusStop;
  final bool isRefreshing;
  final bool isHighlighted;

  BusTimetableState({
    this.selectedLocation = '',
    this.selectedBusStop = '',
    this.isRefreshing = false,
    this.isHighlighted = false,
  });

  BusTimetableState copyWith({
    String? selectedLocation,
    String? selectedBusStop,
    bool? isRefreshing,
    bool? isHighlighted,
  }) {
    return BusTimetableState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      selectedBusStop: selectedBusStop ?? this.selectedBusStop,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isHighlighted: isHighlighted ?? this.isHighlighted,
    );
  }

  @override
  List<Object> get props => [selectedLocation, selectedBusStop, isRefreshing, isHighlighted];
}
