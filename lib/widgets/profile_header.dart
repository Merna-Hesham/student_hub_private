import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget{
  final String name;
  final String subtitle;

  String get initials {
    final words = name.split(' ').where((w) => w.isNotEmpty);
    return words.take(2).map((w) => w[0].toUpperCase()).join();
  }

  const ProfileHeader({super.key, required this.name, required this.subtitle});

  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: scheme.primaryContainer,
          child: Text(
            initials,
            style: textTheme.titleMedium?.copyWith(
              color: scheme.onPrimaryContainer,
            ),
          ),
        ),

        const SizedBox(width: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning,',
              style: textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),

            Text(name, style: textTheme.titleLarge),

            Text(
              subtitle,
              style: textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
