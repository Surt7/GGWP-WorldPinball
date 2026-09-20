import 'package:equatable/equatable.dart';
import '../domain/machine.dart';

abstract class MachinesState extends Equatable {
  const MachinesState();

  @override
  List<Object> get props => [];
}

// État initial (quand rien n'a commencé)
class MachinesInitial extends MachinesState {}

// État pendant le chargement (on affichera un spinner)
class MachinesLoading extends MachinesState {}

// État quand les données sont chargées avec succès
class MachinesLoaded extends MachinesState {
  final List<Machine> machines;

  const MachinesLoaded(this.machines);

  @override
  List<Object> get props => [machines];
}

// État en cas d'erreur
class MachinesError extends MachinesState {
  final String message;

  const MachinesError(this.message);

  @override
  List<Object> get props => [message];
}