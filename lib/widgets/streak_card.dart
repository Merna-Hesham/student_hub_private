import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget{
  final int days;
  final int hours;
  final double progress;

  const StreakCard({
    super.key,
    required this.days,
    required this.hours,
    required this.progress
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_fire_department,
                size: 32,
                color: scheme.onPrimaryContainer,
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$days-day study streak',
                    style: textTheme.titleMedium?.copyWith(
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                  
                  Text(
                    '$hours of 3 hours studied today',
                    style: textTheme.bodyMedium?.copyWith(
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 12,),
          
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              minHeight: 8,
              color: scheme.primary,
              backgroundColor: scheme.surfaceContainerLowest,
            ),
          ),
        ],
      ),
    );
  }
}
