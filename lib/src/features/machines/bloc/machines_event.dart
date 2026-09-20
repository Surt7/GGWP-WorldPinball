

import 'package:equatable/equatable.dart';

abstract class MachineEvent extends Equatable {
  const MachineEvent();

  @override
  List<Object> get props => [];
}

class LoadMachinesEvent extends MachinesEvent {}

class MachinesEvent {
}