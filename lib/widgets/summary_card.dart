import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget{
  final String value;
  final String label;

  const SummaryCard({
    super.key,
    required this.value,
    required this.label
  });

  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

   return Container(
     padding: EdgeInsets.all(16),
     decoration: BoxDecoration(
       color: scheme.surfaceContainerLow,
       borderRadius: BorderRadius.circular(16),
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           value,
           style: textTheme.headlineSmall?.copyWith(color: scheme.primary),
         ),

         const SizedBox(height: 4),

         Text(
           label,
           style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
         ),
       ],
     ),
   );
  }
}
