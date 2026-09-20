import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/machine_repository.dart';
import 'machines_event.dart';
import 'machines_state.dart';

class MachinesBloc extends Bloc<MachinesEvent, MachinesState> {
  final MachineRepository _machineRepository;

  // On initialise avec l'état "Initial"
  MachinesBloc(this._machineRepository) : super(MachinesInitial()) {

    // On enregistre le "handler" pour l'événement de chargement
    on<LoadMachinesEvent>(_onLoadMachines);
  }

  Future<void> _onLoadMachines(
      LoadMachinesEvent event,
      Emitter<MachinesState> emit,
      ) async {
    // 1. On dit à l'UI qu'on charge
    emit(MachinesLoading());

    try {
      // 2. On appelle le repository (ton "Service" en C#)
      final machines = await _machineRepository.getMachines();

      // 3. On envoie l'état de succès avec les données
      emit(MachinesLoaded(machines));
    } catch (e) {
      // 4. En cas d'erreur, on envoie l'état d'erreur
      emit(MachinesError("Impossible de charger les machines : $e"));
    }
  }
}