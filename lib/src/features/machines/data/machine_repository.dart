import '../domain/machine.dart';

/// Repository responsible for fetching Machine data.
/// This acts as an abstraction layer between the BLoC and the Data Source (API/Local DB).
class MachineRepository {
  /// Fetches the list of pinball machines.
  /// Currently using mocked data with a simulated network delay.
  Future<List<Machine>> getMachines() async {
    // Simulate a network delay (1 second).
    await Future.delayed(const Duration(seconds: 1));

    return [
      Machine(
        machineId: '1',
        ipId: 're-death-island',
        displayName: 'Resident Evil: Death Island',
        serialNumber: 'SN-RE-001',
        manufacturer: 'Stern Pinball',
        status: 'Online',
        registeredAt: DateTime.now(),
      ),
      Machine(
        machineId: '2',
        ipId: 'godzilla',
        displayName: 'Godzilla Premium',
        serialNumber: 'SN-GZ-042',
        manufacturer: 'Stern Pinball',
        status: 'Online',
        registeredAt: DateTime.now(),
      ),
    ];
  }
}
