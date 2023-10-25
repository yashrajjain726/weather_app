import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/domain/entities/weather.dart';

import '../../../core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherData(Position position);
}
