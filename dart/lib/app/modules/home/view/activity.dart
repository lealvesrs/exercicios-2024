import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
                color: fromCssColor("white"),
                onPressed: () {
                  context.go("/");
                }),
            centerTitle: true,
            backgroundColor: fromCssColor("#456189"),
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Chuva ❤️ Flutter',
                style: TextStyle(color: fromCssColor("white")),
              ),
            )));
  }
}
