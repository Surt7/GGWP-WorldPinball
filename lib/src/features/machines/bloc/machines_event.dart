import 'package:equatable/equatable.dart';

/// Base class for all Machine-related events.
/// Events are "Inputs" to the BLoC.
abstract class MachinesEvent extends Equatable {
  const MachinesEvent();

  @override
  List<Object> get props => [];
}

/// Event triggered when the user wants to load the machines list.
class LoadMachinesEvent extends MachinesEvent {}
