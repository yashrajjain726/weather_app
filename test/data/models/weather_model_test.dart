import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/data/models/weather_model.dart';
import 'package:weather_app/features/domain/entities/current/current_weather.dart';
import 'package:weather_app/features/domain/entities/next/next_seven_day_weather.dart';
import 'package:weather_app/features/domain/entities/today/today_weather.dart';

import '../../test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('WeatherModel', () {
    test('fromJson should create a WeatherModel from a JSON map', () async {
      final json =
          await getJsonData('assets/test/weather_model_test_data.json');

      final weatherModel = WeatherModel.fromJson(json);
      expect(weatherModel.currentData, isA<CurrentWeather>());
      expect(weatherModel.nextSevenDayWeather, isA<NextSevenDayWeather>());
      expect(weatherModel.todayData, isA<TodayWeather>());

      expect(weatherModel.currentData.currentData.current, 296);
      expect(weatherModel.currentData.currentData.name, 'Clouds');
      expect(weatherModel.todayData.todayData.length, 4);
      expect(weatherModel.nextSevenDayWeather.listOfNextSevenDayData.length, 7);
    });
  });
}
