import 'package:code_generator_app/ui/main/main_screen.dart';
import 'package:code_generator_app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  // CodeGenerator.test('google');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PasSculptor',
      theme: AppTheme.themeData,
      home: MainScreen(),
    );
  }
}
