import '../domain/machine.dart';

class MachineRepository {
  Future<List<Machine>> getMachines() async{
    await Future.delayed(const Duration(seconds: 1));

    return  [
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