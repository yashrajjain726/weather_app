import 'package:dartz/dartz.dart';
import 'package:weather_app/core/params/location.dart';
import 'package:weather_app/features/domain/entities/weather.dart';

import '../../../core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherData(Location location);
}
