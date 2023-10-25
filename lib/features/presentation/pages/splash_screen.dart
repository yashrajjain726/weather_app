import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/splash_animation.json',
            width: 250,
            height: 250,
          ),
        ),
        Text(
          'Weather App',
          style: GoogleFonts.questrial(
            color: Colors.black,
            fontSize: 25,
          ),
        )
      ],
    ));
  }
}
