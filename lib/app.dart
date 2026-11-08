import 'package:flutter/material.dart';
import 'package:flutter_online/screens/welcome_screen.dart';
import 'package:flutter_online/theme/app_theme.dart';

class StudentHupApp extends StatelessWidget{

  const StudentHupApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'student_hub',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: WelcomeScreen(),
    );
  }
}
