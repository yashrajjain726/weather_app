import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/injection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<WeatherBloc>(
        create: (_) => sl(),
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherInitial) {
            context.read<WeatherBloc>().add(FetchWeatherEvent());
            return const Center(
              child: Text('EMPTY'),
            );
          } else if (state is WeatherLoading) {
            return const CircularProgressIndicator();
          } else if (state is WeatherLoaded) {
            print(state.weather);
            return Center(child: Text('LOADED'));
          } else {
            return const Center(
              child: Text(
                "Some Error occured",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        }),
      ),
    );
  }
}
