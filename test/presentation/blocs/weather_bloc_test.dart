import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:weather_app/core/errors/errors.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/params/fetch_location.dart';
import 'package:weather_app/features/data/models/weather_model.dart';
import 'package:weather_app/features/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/presentation/bloc/weather_bloc.dart';

import '../../test.dart';
import 'weather_bloc_test.mocks.dart';

@GenerateMocks([GetWeatherUseCase, FetchLocation])
void main() {
  late MockGetWeatherUseCase mockGetWeatherUseCase;
  late MockFetchLocation mockFetchLocation;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetWeatherUseCase = MockGetWeatherUseCase();
    mockFetchLocation = MockFetchLocation();
    weatherBloc = WeatherBloc(
        getWeatherUseCase: mockGetWeatherUseCase,
        fetchLocation: mockFetchLocation);
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  tearDown(() {
    weatherBloc.close();
  });

  test('Initial state should be WeatherInitial', () {
    expect(weatherBloc.state, WeatherInitial());
  });

  test(
    'It should get the location co-ordinates of the weather',
    () async* {
      final location = Position(
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
      when(mockFetchLocation.getLocationAddress())
          .thenAnswer((_) async => Right(location));
      weatherBloc.add(const FetchWeatherEvent());
      await untilCalled(mockFetchLocation.getLocationAddress());
      verify(mockFetchLocation.getLocationAddress());
    },
  );

  test(
    'It should throw an error when the users denies the permission to fetch',
    () async* {
      when(mockFetchLocation.getLocationAddress())
          .thenAnswer((_) async => Left(LocationFailure()));
      final expected = [
        WeatherInitial(),
        WeatherFetchFailed(message: Errors.LocationAccessIssueFound),
      ];
      expectLater(weatherBloc.state, emitsInOrder(expected));
      weatherBloc.add(const FetchWeatherEvent());
    },
  );

  test(
    'It should go through the normal flow without any issues',
    () async* {
      final location = Position(
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
      final json =
          await getJsonData('assets/test/weather_model_test_data.json');
      final weatherData = WeatherModel.fromJson(json);
      when(mockFetchLocation.getAddressFromLatLong(location))
          .thenAnswer((_) async => 'ADDRESS');
      when(mockFetchLocation.getLocationAddress())
          .thenAnswer((_) async => Right(location));
      when(mockGetWeatherUseCase(any))
          .thenAnswer((_) async => Right(weatherData));
      final expected = [
        WeatherInitial(),
        WeatherLoading(),
        WeatherLoaded(weather: weatherData, address: 'ADDRESS'),
      ];
      expectLater(weatherBloc.state, emitsInOrder(expected));
      weatherBloc.add(const FetchWeatherEvent());
    },
  );
}
