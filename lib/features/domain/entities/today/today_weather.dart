import 'package:equatable/equatable.dart';

class TodayWeather extends Equatable {
  final List<TodayData> todayData;

  TodayWeather({required this.todayData});

  @override
  List<Object> get props => [todayData];
}

class TodayData extends Equatable {
  final int current;
  final String time;
  final double windSpeed;

  const TodayData({
    required this.current,
    required this.time,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [current, time, windSpeed];
}
