import 'package:equatable/equatable.dart';

class Machine extends Equatable {
final String machineId;
final String ipId;
final String displayName;
final String serialNumber;
final String manufacturer;
final String status;
final DateTime registeredAt;

const Machine({
required this.machineId,
required this.ipId,
  required this.displayName,
required this.serialNumber,
required this.manufacturer,
required this.status,
required this.registeredAt,
});

  @override
  // Equatable uses 'props' to compare objects. 
  // It helps Flutter know when to rebuild the UI.
  List<Object?> get props => [
        machineId,
        ipId,
        displayName,
        serialNumber,
        manufacturer,
        status,
        registeredAt,
      ];
}
