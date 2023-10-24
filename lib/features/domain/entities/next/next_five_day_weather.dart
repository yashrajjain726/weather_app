import 'package:equatable/equatable.dart';

class NextFiveDayWeather extends Equatable {
  final List<NextFiveDayData> listOfNextFiveDayData;
  NextFiveDayWeather({
    required this.listOfNextFiveDayData,
  });

  @override
  List<Object> get props => [listOfNextFiveDayData];
}

class NextFiveDayData extends Equatable {
  final int max;
  final int min;
  final String name;
  final String day;
  final String image;

  const NextFiveDayData({
    required this.max,
    required this.min,
    required this.name,
    required this.day,
    required this.image,
  });

  @override
  List<Object?> get props => [max, min, name, day, image];
}
