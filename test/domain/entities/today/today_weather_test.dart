import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/domain/entities/today/today_weather.dart';

void main() {
  group('TodayWeather', () {
    test('props should contain todayData', () {
      const todayData = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );
      final todayWeather = TodayWeather(todayData: const [todayData]);

      expect(todayWeather.props, [
        [todayData]
      ]);
    });

    test('should be equal if the todayData is the same', () {
      const todayData1 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );
      const todayData2 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );

      final todayWeather1 = TodayWeather(todayData: const [todayData1]);
      final todayWeather2 = TodayWeather(todayData: const [todayData2]);

      expect(todayWeather1, equals(todayWeather2));
    });

    test('should have the same hashCode if the todayData is the same', () {
      const todayData1 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );
      const todayData2 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );

      final todayWeather1 = TodayWeather(todayData: const [todayData1]);
      final todayWeather2 = TodayWeather(todayData: const [todayData2]);

      expect(todayWeather1.hashCode, equals(todayWeather2.hashCode));
    });
  });

  group('TodayData', () {
    test('props should contain all properties', () {
      const todayData = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );

      expect(todayData.props, [25, '12:00 PM', 5.0]);
    });

    test('should be equal if all properties are the same', () {
      const todayData1 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );
      const todayData2 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );

      expect(todayData1, equals(todayData2));
    });

    test('should have the same hashCode if all properties are the same', () {
      const todayData1 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );
      const todayData2 = TodayData(
        current: 25,
        time: '12:00 PM',
        windSpeed: 5.0,
      );

      expect(todayData1.hashCode, equals(todayData2.hashCode));
    });
  });
}
