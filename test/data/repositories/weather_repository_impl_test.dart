import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/network/network_checker.dart';
import 'package:weather_app/features/data/datasource/api_client.dart';
import 'package:weather_app/features/data/models/weather_model.dart';
import 'package:weather_app/features/data/repository/weather_repository_impl.dart';
import '../../test.dart';
import 'weather_repository_impl_test.mocks.dart';

@GenerateMocks([ApiClient, NetworkChecker])
void main() {
  late WeatherRepositoryImpl repository;
  late MockApiClient mockApiClient;
  late MockNetworkChecker mockNetworkChecker;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockApiClient = MockApiClient();
    mockNetworkChecker = MockNetworkChecker();
    repository = WeatherRepositoryImpl(
        apiClient: mockApiClient, checkNetwork: mockNetworkChecker);
  });

  group('getWeatherData', () {
    final position = Position(
        latitude: 123.45,
        longitude: 67.89,
        timestamp: DateTime.now(),
        accuracy: 1,
        altitude: 1,
        altitudeAccuracy: 1,
        heading: 1,
        headingAccuracy: 1,
        speed: 1,
        speedAccuracy: 1);

    test('should return Weather data when network is connected', () async {
      when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);
      final json =
          await getJsonData('assets/test/weather_model_test_data.json');
      final weatherData = WeatherModel.fromJson(json);
      when(mockApiClient.getWeatherData(position))
          .thenAnswer((_) async => weatherData);
      final result = await repository.getWeatherData(position);
      expect(result, Right(weatherData));
      verify(mockApiClient.getWeatherData(position)).called(1);
      verify(mockNetworkChecker.isConnected).called(1);
      verifyNoMoreInteractions(mockApiClient);
      verifyNoMoreInteractions(mockNetworkChecker);
    });

    test('should return NetworkFailure when network is not connected',
        () async {
      when(mockNetworkChecker.isConnected).thenAnswer((_) async => false);
      final result = await repository.getWeatherData(position);
      expect(result, Left(NetworkFailure()));
      verify(mockNetworkChecker.isConnected).called(1);
      verifyNoMoreInteractions(mockApiClient);
      verifyNoMoreInteractions(mockNetworkChecker);
    });

    test(
        'should return ServerFailure when an exception is thrown by the API client',
        () async {
      when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);
      when(mockApiClient.getWeatherData(position)).thenThrow(ServerException());
      final result = await repository.getWeatherData(position);
      expect(result, Left(ServerFailure()));
      verify(mockApiClient.getWeatherData(position)).called(1);
      verify(mockNetworkChecker.isConnected).called(1);
      verifyNoMoreInteractions(mockApiClient);
      verifyNoMoreInteractions(mockNetworkChecker);
    });
  });
}
