import 'package:flutter/material.dart';
import 'package:flutter_online/widgets/summary_card.dart';

class SummaryRow extends StatelessWidget{

  const SummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Expanded(
         child: SummaryCard(
           value: '6',
           label: 'Courses',
         ),
       ),

       const SizedBox(width: 12),

       Expanded(
         child: SummaryCard(
           value: '18',
           label: 'Credits',
         ),
       ),

       const SizedBox(width: 12),

       Expanded(
         child: SummaryCard(
           value: '3.14',
           label: 'GPA',
         ),
       ),
     ],
   );
  }
}
