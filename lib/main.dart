import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/routes.dart';
import 'package:weather_app/features/presentation/pages/splash_screen.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
