import 'package:intl/intl.dart';
import 'package:weather_app/features/domain/entities/current/current_weather.dart';
import 'package:weather_app/features/domain/entities/next/next_five_day_weather.dart';
import 'package:weather_app/features/domain/entities/today/today_weather.dart';
import 'package:weather_app/features/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required CurrentWeather currentWeather,
    required NextFiveDayWeather nextFiveDayWeather,
    required TodayWeather todayWeather,
  }) : super(currentWeather, nextFiveDayWeather, todayWeather);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.now();
    var current = json["current"];

    CurrentData currentData = CurrentData(
      current: current["temp"].round(),
      name: current["weather"][0]["main"].toString(),
      day: DateFormat("EEEE dd MMMM").format(date),
      wind: current["wind_speed"]?.round(),
      humidity: current["humidity"]?.round(),
      chanceRain: current["uvi"]?.round(),
      image: findIcon(current["weather"][0]["main"].toString(), true),
    );

    List<TodayData> todayData = [];
    int hour = int.parse(DateFormat("hh").format(date));
    for (var i = 0; i < 4; i++) {
      var temp = json["hourly"];
      var hourly = TodayData(
          current: temp[i]["temp"].round(),
          image: findIcon(temp[i]["weather"][0]["main"].toString(), false),
          time: "${Duration(hours: hour + i + 1).toString().split(":")[0]}:00");
      todayData.add(hourly);
    }

    List<NextFiveDayData> nextFiveDayData = [];
    for (var i = 0; i < 7; i++) {
      String day = DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + i + 1))
          .substring(0, 3);
      var temp = json["daily"][i];
      var hourly = NextFiveDayData(
        max: temp["temp"]["max"].round(),
        min: temp["temp"]["min"].round(),
        image: findIcon(temp["weather"][0]["main"].toString(), false),
        name: temp["weather"][0]["main"].toString(),
        day: day,
      );
      nextFiveDayData.add(hourly);
    }

    return WeatherModel(
        currentWeather: CurrentWeather(currentData: currentData),
        nextFiveDayWeather:
            NextFiveDayWeather(listOfNextFiveDayData: nextFiveDayData),
        todayWeather: TodayWeather(todayData: todayData));
  }
}

String findIcon(String name, bool type) {
  if (type) {
    switch (name) {
      case "Clouds":
        return "assets/sunny.png";

      case "Rain":
        return "assets/rainy.png";

      case "Drizzle":
        return "assets/rainy.png";

      case "Thunderstorm":
        return "assets/thunder.png";

      case "Snow":
        return "assets/snow.png";

      default:
        return "assets/sunny.png";
    }
  } else {
    switch (name) {
      case "Clouds":
        return "assets/sunny_2d.png";

      case "Rain":
        return "assets/rainy_2d.png";

      case "Drizzle":
        return "assets/rainy_2d.png";

      case "Thunderstorm":
        return "assets/thunder_2d.png";

      case "Snow":
        return "assets/snow_2d.png";

      default:
        return "assets/sunny_2d.png";
    }
  }
}