import 'package:equatable/equatable.dart';

class NextSevenDayWeather extends Equatable {
  final List<NextSevenDayData> listOfNextSevenDayData;
  NextSevenDayWeather({
    required this.listOfNextSevenDayData,
  });

  @override
  List<Object> get props => [listOfNextSevenDayData];
}

class NextSevenDayData extends Equatable {
  final int max;
  final int min;
  final String name;
  final String day;
  final String image;

  const NextSevenDayData({
    required this.max,
    required this.min,
    required this.name,
    required this.day,
    required this.image,
  });

  @override
  List<Object?> get props => [max, min, name, day, image];
}
