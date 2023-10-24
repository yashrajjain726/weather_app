// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/errors/errors.dart';

import 'package:weather_app/core/params/fetch_location.dart';
import 'package:weather_app/features/domain/entities/weather.dart';
import 'package:weather_app/features/domain/usecases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final FetchLocation fetchLocation;
  WeatherBloc({
    required this.getWeatherUseCase,
    required this.fetchLocation,
  }) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<FetchWeatherEvent>(_fetchWeather);
  }

  _fetchWeather(FetchWeatherEvent event, Emitter emitter) async {
    final location = await fetchLocation.getLocationAddress();
    location.fold(
        (failure) =>
            emit(WeatherFetchFailed(message: Errors.LocationAccessIssueFound)),
        (location) async {
      emit(WeatherLoading());
      final weather = await getWeatherUseCase(location);
      weather.fold((failure) {
        emit(WeatherFetchFailed(message: Errors.SomethingWentWrong));
      }, (weather) {
        emit(WeatherLoaded(weather: weather));
      });
    });
  }
}
