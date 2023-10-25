import 'package:equatable/equatable.dart';
import 'package:weather_app/features/domain/entities/current/current_weather.dart';
import 'package:weather_app/features/domain/entities/next/next_seven_day_weather.dart';
import 'package:weather_app/features/domain/entities/today/today_weather.dart';

class Weather extends Equatable {
  final CurrentWeather currentData;
  final NextSevenDayWeather nextSevenDayWeather;
  final TodayWeather todayData;
  const Weather(this.currentData, this.nextSevenDayWeather, this.todayData);

  @override
  List<Object> get props => [currentData, nextSevenDayWeather, todayData];
}
