import 'package:equatable/equatable.dart';
import 'package:weather_app/features/domain/entities/current/current_weather.dart';
import 'package:weather_app/features/domain/entities/next/next_five_day_weather.dart';
import 'package:weather_app/features/domain/entities/today/today_weather.dart';

class Weather extends Equatable {
  final CurrentWeather currentData;
  final NextFiveDayWeather nextFiveDayData;
  final TodayWeather todayData;
  const Weather(this.currentData, this.nextFiveDayData, this.todayData);

  @override
  List<Object> get props => [currentData, nextFiveDayData, todayData];
}
