import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/domain/entities/today/today_weather.dart';
import 'package:weather_app/features/presentation/widgets/today/today_temp_single_widget.dart';

class TodayTempListWidget extends StatefulWidget {
  final List<TodayData> data;
  const TodayTempListWidget({super.key, required this.data});

  @override
  State<TodayTempListWidget> createState() => _TodayTempWidgetState();
}

class _TodayTempWidgetState extends State<TodayTempListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.black.withOpacity(0.05),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.width * 0.03,
                ),
                child: Text(
                  'Forecast for today',
                  style: GoogleFonts.questrial(
                    color: Colors.black,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.data.map((hourlyData) {
                    return TodayTempSingleWidget(
                      time: hourlyData.time,
                      temp: hourlyData.current,
                      wind: hourlyData.windSpeed,
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
