import 'package:flutter/material.dart';

class NoPageFound extends StatelessWidget {
  static const String routeName = '/404';
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page not found',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
