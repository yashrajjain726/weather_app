import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/network/network_checker.dart';
import 'package:weather_app/core/params/location.dart';
import 'package:weather_app/features/data/datasource/api_client.dart';
import 'package:weather_app/features/data/repository/weather_repository.dart';
import 'package:weather_app/features/domain/entities/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final ApiClient apiClient;
  final NetworkChecker checkNetwork;

  WeatherRepositoryImpl({required this.apiClient, required this.checkNetwork});
  @override
  Future<Either<Failure, Weather>> getWeatherData(Location location) async {
    if (await checkNetwork.isConnected) {
      try {
        final weatherRemoteData = await apiClient.getWeatherData(location);
        return Right(weatherRemoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
