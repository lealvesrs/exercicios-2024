import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/calendar_days.dart';
import 'package:flutter/material.dart';

class CalendarBar extends StatefulWidget {
  const CalendarBar({super.key});

  @override
  State<CalendarBar> createState() => _CalendarBarState();
}

class _CalendarBarState extends State<CalendarBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        height: 50,
        width: double.infinity,
        color: MyColor.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              width: 50,
              height: 50,
              child: const Text(
                "NOV 2023",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const CalendarDays(title: "26"),
            const CalendarDays(title: "27"),
            const CalendarDays(title: "28"),
            const CalendarDays(title: "29"),
            const CalendarDays(title: "30"),
          ],
        ),
      ),
    );
  }
}
