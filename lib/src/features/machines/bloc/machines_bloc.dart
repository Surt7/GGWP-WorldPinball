import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/machine_repository.dart';
import 'machines_event.dart';
import 'machines_state.dart';

/// The 'Brain' of the Machines feature.
/// It converts [MachinesEvent] into [MachinesState].
class MachinesBloc extends Bloc<MachinesEvent, MachinesState> {
  final MachineRepository _machineRepository;

  // Initialize with the 'Initial' state.
  MachinesBloc(this._machineRepository) : super(MachinesInitial()) {
    // Register the event handler for loading machines.
    on<LoadMachinesEvent>(_onLoadMachines);
  }

  /// Handler for the [LoadMachinesEvent].
  /// This is where the business logic resides.
  Future<void> _onLoadMachines(
    LoadMachinesEvent event,
    Emitter<MachinesState> emit,
  ) async {
    // 1. Tell the UI to show a loading indicator.
    emit(MachinesLoading());

    try {
      // 2. Fetch data from the repository (similar to a Service in C#).
      final machines = await _machineRepository.getMachines();

      // 3. Emit the success state with the retrieved data.
      emit(MachinesLoaded(machines));
    } catch (e) {
      // 4. Emit an error state if something goes wrong.
      emit(MachinesError("Failed to load machines: $e"));
    }
  }
}
