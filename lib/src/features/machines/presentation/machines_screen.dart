import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/machines_bloc.dart';
import '../bloc/machines_state.dart';
import 'machine_card.dart';

/// Screen responsible for displaying the list of machines.
/// Uses StatelessWidget because BLoC handles the state management.
class MachinesScreen extends StatelessWidget {
  const MachinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MachinesBloc, MachinesState>(
      builder: (context, state) {
        if (state is MachinesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MachinesLoaded) {
          final machines = state.machines;

          if (machines.isEmpty) {
            return const Center(child: Text('No machines found.'));
          }

          return ListView.builder(
            itemCount: machines.length,
            itemBuilder: (context, index) {
              return MachineCard(machine: machines[index]);
            },
          );
        }

        if (state is MachinesError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
