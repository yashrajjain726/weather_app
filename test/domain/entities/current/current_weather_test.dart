import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/features/domain/entities/current/current_weather.dart';

void main() {
  group('CurrentWeather', () {
    test('props should contain currentData', () {
      const currentData = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );
      const currentWeather = CurrentWeather(currentData: currentData);

      expect(currentWeather.props, [currentData]);
    });

    test('should be equal if the currentData is the same', () {
      const currentData1 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );
      const currentData2 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );

      const currentWeather1 = CurrentWeather(currentData: currentData1);
      const currentWeather2 = CurrentWeather(currentData: currentData2);

      expect(currentWeather1, equals(currentWeather2));
    });

    test('should have the same hashCode if the currentData is the same', () {
      const currentData1 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );
      const currentData2 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );

      const currentWeather1 = CurrentWeather(currentData: currentData1);
      const currentWeather2 = CurrentWeather(currentData: currentData2);

      expect(currentWeather1.hashCode, equals(currentWeather2.hashCode));
    });
  });

  group('CurrentData', () {
    test('props should contain all properties', () {
      const currentData = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );

      expect(currentData.props, [25, 'Sunny', 'Sunday', 5, 50, 10]);
    });

    test('should be equal if all properties are the same', () {
      const currentData1 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );
      const currentData2 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );

      expect(currentData1, equals(currentData2));
    });

    test('should have the same hashCode if all properties are the same', () {
      const currentData1 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );
      const currentData2 = CurrentData(
        current: 25,
        name: 'Sunny',
        day: 'Sunday',
        wind: 5,
        humidity: 50,
        chanceRain: 10,
      );

      expect(currentData1.hashCode, equals(currentData2.hashCode));
    });
  });
}
