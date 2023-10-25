import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/domain/entities/current/current_weather.dart';

class CurrentTempWidget extends StatefulWidget {
  final CurrentData data;
  final String address;
  const CurrentTempWidget({
    Key? key,
    required this.data,
    required this.address,
  }) : super(key: key);

  @override
  State<CurrentTempWidget> createState() => _TodayTempWidgetState();
}

class _TodayTempWidgetState extends State<CurrentTempWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
          ),
          child: Align(
            child: Text(
              widget.address.toString(),
              style: GoogleFonts.questrial(
                color: Colors.black,
                fontSize: size.height * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.005,
          ),
          child: Align(
            child: Text(
              widget.data.day,
              style: GoogleFonts.questrial(
                color: Colors.black54,
                fontSize: size.height * 0.035,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
          ),
          child: Align(
            child: Text(
              '${widget.data.current}˚C',
              style: GoogleFonts.questrial(
                color: widget.data.current <= 0
                    ? Colors.blue
                    : widget.data.current > 0 && widget.data.current <= 15
                        ? Colors.indigo
                        : widget.data.current > 15 && widget.data.current < 30
                            ? Colors.deepPurple
                            : Colors.pink,
                fontSize: size.height * 0.13,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
          child: const Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.005,
          ),
          child: Align(
            child: Text(
              widget.data.name,
              style: GoogleFonts.questrial(
                color: Colors.black54,
                fontSize: size.height * 0.03,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
