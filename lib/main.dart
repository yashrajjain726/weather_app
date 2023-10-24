import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/routes.dart';
import 'package:weather_app/features/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      home: const HomeScreen(),
    );
  }
}
