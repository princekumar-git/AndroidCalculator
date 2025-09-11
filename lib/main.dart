import 'package:flutter/material.dart';
import 'package:my_calculator/calculator_ui.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white, fontSize: 48),
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const CalculatorPage(),
    );
  }
}