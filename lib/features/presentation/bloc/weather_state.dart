part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  final String address;

  const WeatherLoaded({
    required this.weather,
    required this.address,
  });
  @override
  List<Object> get props => [weather, address];
}

class WeatherFetchFailed extends WeatherState {
  final String message;

  WeatherFetchFailed({required this.message});
  @override
  List<Object> get props => [message];
}
