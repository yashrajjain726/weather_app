import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/errors/errors.dart';
import 'package:weather_app/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/presentation/pages/splash_screen.dart';
import 'package:weather_app/features/presentation/widgets/current_temp_widget.dart';
import 'package:weather_app/features/presentation/widgets/next/seven_day_data_list_widget.dart';
import 'package:weather_app/features/presentation/widgets/today/today_temp_list_widget.dart';
import 'package:weather_app/injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (_) => sl(),
      child: SafeArea(
        child: Scaffold(
          body:
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherInitial) {
              context.read<WeatherBloc>().add(const FetchWeatherEvent());
              return const SplashScreen();
            } else if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              final data = state.weather;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CurrentTempWidget(
                        data: data.currentData.currentData,
                        address: state.address),
                    TodayTempListWidget(data: data.todayData.todayData),
                    SevenDayDataListWidget(
                        data: data.nextSevenDayWeather.listOfNextSevenDayData),
                  ],
                ),
              );
            }
            return const Center(
              child: Text(Errors.SomethingWentWrong),
            );
          }),
        ),
      ),
    );
  }
}
