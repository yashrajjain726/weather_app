import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/network/network_checker.dart';
import 'package:weather_app/core/params/fetch_location.dart';
import 'package:weather_app/features/data/datasource/api_client.dart';
import 'package:weather_app/features/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOC INJECTION
  sl.registerFactory(() => WeatherBloc(
        getWeatherUseCase: sl(),
        fetchLocation: sl(),
      ));

  // USECASE INJECTION
  sl.registerLazySingleton(() => GetWeatherUseCase(weatherRepository: sl()));

  // REPOSITORY INJECTION
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      apiClient: sl(),
      checkNetwork: sl(),
    ),
  );

  // API CLIENT INJECTION
  sl.registerLazySingleton<ApiClient>(() => ApiClient(httpClient: sl()));

  // CORE INJECTION
  sl.registerLazySingleton<FetchLocation>(() => FetchLocationImpl());
  sl.registerLazySingleton<NetworkChecker>(
      () => NetworkCheckerImpl(internetCheck: sl()));

  // EXTERNAL
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
