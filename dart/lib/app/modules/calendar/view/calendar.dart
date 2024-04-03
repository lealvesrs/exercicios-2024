import 'package:chuva_dart/app/modules/calendar/view/components/calendar_bar.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/card_paper.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
/*   DateTime _currentDate = DateTime(2023, 11, 26);
  bool _clicked = false;

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: fromCssColor("#456189"),
        title: Text(
          'Chuva ❤️ Flutter',
          style: TextStyle(color: fromCssColor("white")),
        ),
      ),
      body: const Column(
        children: [
          CalendarBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CardPaper()],
            ),
          ),
        ],
      ),
    );
  }
}
