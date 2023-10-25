import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/domain/entities/weather.dart';

class GetWeatherUseCase {
  WeatherRepository weatherRepository;
  GetWeatherUseCase({
    required this.weatherRepository,
  });
  Future<Either<Failure, Weather>> call(Position position) async {
    return await weatherRepository.getWeatherData(position);
  }
}
