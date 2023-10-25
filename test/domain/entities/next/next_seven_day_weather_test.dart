import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/features/domain/entities/next/next_seven_day_weather.dart';

void main() {
  group('NextSevenDayWeather', () {
    test('props should contain listOfNextSevenDayData', () {
      const nextSevenDayData = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );
      final nextSevenDayWeather =
          NextSevenDayWeather(listOfNextSevenDayData: const [nextSevenDayData]);

      expect(nextSevenDayWeather.props, [
        [nextSevenDayData]
      ]);
    });

    test('should be equal if the listOfNextSevenDayData is the same', () {
      const nextSevenDayData1 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );
      const nextSevenDayData2 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );

      final nextSevenDayWeather1 = NextSevenDayWeather(
          listOfNextSevenDayData: const [nextSevenDayData1]);
      final nextSevenDayWeather2 = NextSevenDayWeather(
          listOfNextSevenDayData: const [nextSevenDayData2]);

      expect(nextSevenDayWeather1, equals(nextSevenDayWeather2));
    });

    test(
        'should have the same hashCode if the listOfNextSevenDayData is the same',
        () {
      const nextSevenDayData1 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );
      const nextSevenDayData2 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );

      final nextSevenDayWeather1 = NextSevenDayWeather(
          listOfNextSevenDayData: const [nextSevenDayData1]);
      final nextSevenDayWeather2 = NextSevenDayWeather(
          listOfNextSevenDayData: const [nextSevenDayData2]);

      expect(
          nextSevenDayWeather1.hashCode, equals(nextSevenDayWeather2.hashCode));
    });
  });

  group('NextSevenDayData', () {
    test('props should contain all properties', () {
      const nextSevenDayData = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );

      expect(nextSevenDayData.props, [25, 15, 'Sunny', 'Sunday', 'sunny.png']);
    });

    test('should be equal if all properties are the same', () {
      const nextSevenDayData1 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );
      const nextSevenDayData2 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );

      expect(nextSevenDayData1, equals(nextSevenDayData2));
    });

    test('should have the same hashCode if all properties are the same', () {
      const nextSevenDayData1 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );
      const nextSevenDayData2 = NextSevenDayData(
        max: 25,
        min: 15,
        name: 'Sunny',
        day: 'Sunday',
        image: 'sunny.png',
      );

      expect(nextSevenDayData1.hashCode, equals(nextSevenDayData2.hashCode));
    });
  });
}
