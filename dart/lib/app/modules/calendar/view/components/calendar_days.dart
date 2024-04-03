import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class CalendarDays extends StatefulWidget {
  const CalendarDays({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalendarDays> createState() => _CalendarDaysState();
}

class _CalendarDaysState extends State<CalendarDays> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: fromCssColor("lightgray"),
              fontSize: 15),
        ),
      ),
    );
  }
}
