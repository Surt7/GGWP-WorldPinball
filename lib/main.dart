import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_pinball_gg_wp/src/features/machines/presentation/machine_card.dart';
import 'package:world_pinball_gg_wp/src/shared/theme/app_theme.dart';
import 'src/features/machines/data/machine_repository.dart';
import 'src/features/machines/bloc/machines_bloc.dart';
import 'src/features/machines/bloc/machines_event.dart';
import 'src/features/machines/bloc/machines_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Pinball',
      theme: AppTheme.darkTheme,

      home: BlocProvider(
        create: (context) => MachinesBloc(MachineRepository())..add(LoadMachinesEvent()),
        child: const MainNavigationScreen(),
      ),
    );
  }
}

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('World Pinball'),
      ),
      body: BlocBuilder<MachinesBloc, MachinesState>(
        builder: (context, state) {
          if (state is MachinesLoading) {
            // État : On attend les données
            return const Center(child: CircularProgressIndicator());
          } 
          
          if (state is MachinesLoaded) {
            // État : On a reçu les données (la liste)
            final machines = state.machines;
            
            if (machines.isEmpty) {
              return const Center(child: Text('Aucune machine trouvée'));
            }
            
            return ListView.builder(
              itemCount: machines.length,
              itemBuilder: (context, index) {
                final machine = machines[index];
                return MachineCard(machine: machine);
              },
            );
          } 
          
          if (state is MachinesError) {

            return Center(child: Text(state.message));
          }


          return const Center(child: Text('Initialisation...'));
        },
      ),
    );
  }
}
