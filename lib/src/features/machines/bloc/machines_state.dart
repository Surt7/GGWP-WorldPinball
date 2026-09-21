import 'package:equatable/equatable.dart';
import '../domain/machine.dart';

/// Base class for all Machine-related states.
/// States are "Outputs" from the BLoC.
abstract class MachinesState extends Equatable {
  const MachinesState();

  @override
  List<Object> get props => [];
}

/// Initial state: nothing has happened yet.
class MachinesInitial extends MachinesState {}

/// Loading state: the app is fetching data (show a spinner).
class MachinesLoading extends MachinesState {}

/// Success state: data loaded successfully.
class MachinesLoaded extends MachinesState {
  final List<Machine> machines;

  const MachinesLoaded(this.machines);

  @override
  List<Object> get props => [machines];
}

/// Error state: something went wrong.
class MachinesError extends MachinesState {
  final String message;

  const MachinesError(this.message);

  @override
  List<Object> get props => [message];
}
