import 'package:flutter/material.dart';
import '../domain/machine.dart';

class MachineCard extends StatelessWidget {
  final Machine machine;

  const MachineCard({super.key, required this.machine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias, // Content won't bleed out of rounded corners
      child: IntrinsicHeight(
        // Forces the Row children to match the height of the tallest child
        child: Row(
          children: [
            // Left border (Primary color from theme)
            Container(
              width: 6,
              color: Theme.of(context).colorScheme.primary,
            ),
            // Card Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      machine.manufacturer.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      machine.displayName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('SN: ${machine.serialNumber}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
