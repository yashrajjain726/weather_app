import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/domain/entities/next/next_seven_day_weather.dart';
import 'package:weather_app/features/presentation/widgets/next/seven_day_data_single_widget.dart';

class SevenDayDataListWidget extends StatelessWidget {
  final List<NextSevenDayData> data;
  const SevenDayDataListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.03,
                ),
                child: Text(
                  '7-day forecast',
                  style: GoogleFonts.questrial(
                    color: Colors.black,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: data.map((daysData) {
                    return SevenDayDataSingleWidget(
                      time: daysData.day,
                      dayType: daysData.name,
                      minTemp: daysData.min,
                      maxTemp: daysData.max,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
