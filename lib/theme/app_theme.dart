import 'package:flutter/material.dart';

const Color kSeedColor = Color(0xFF006A6A);

ThemeData buildTheme(Brightness brightness){
  final scheme = ColorScheme.fromSeed(
    seedColor: kSeedColor,
    brightness: brightness
  );

  return ThemeData(useMaterial3: true, colorScheme: scheme);
}
