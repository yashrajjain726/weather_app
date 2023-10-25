import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/data/models/weather_model.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/domain/usecases/get_weather_usecase.dart';

import '../../test.dart';
import 'get_weather_usecase_test.mocks.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late GetWeatherUseCase useCase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockRepository = MockWeatherRepository();
    useCase = GetWeatherUseCase(weatherRepository: mockRepository);
  });

  group('call', () {
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

    test('should return Weather data when repository call is successful',
        () async {
      final json =
          await getJsonData('assets/test/weather_model_test_data.json');
      final weatherData = WeatherModel.fromJson(json);
      when(mockRepository.getWeatherData(position))
          .thenAnswer((_) async => Right(weatherData));
      final result = await useCase.call(position);
      expect(result, Right(weatherData));
      verify(mockRepository.getWeatherData(position)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a Failure when repository call fails', () async {
      when(mockRepository.getWeatherData(position))
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await useCase.call(position);
      expect(result, Left(ServerFailure()));
      verify(mockRepository.getWeatherData(position)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
