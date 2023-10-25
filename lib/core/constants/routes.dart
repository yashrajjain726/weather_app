import 'package:flutter/material.dart';
import 'package:weather_app/core/screens/page_not_found.dart';
import 'package:weather_app/features/presentation/pages/home_screen.dart';
import 'package:weather_app/features/presentation/pages/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return buildRoute(screen: const HomeScreen());
    case '/splash':
      return buildRoute(screen: const SplashScreen());
    default:
      return buildRoute(screen: const NoPageFound());
  }
}

buildRoute({required Widget screen}) {
  return MaterialPageRoute(builder: (_) => screen);
}
