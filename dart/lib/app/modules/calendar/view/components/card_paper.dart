import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class CardPaper extends StatelessWidget {
  const CardPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.green, width: 5))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Palestra de 08:00 até 09:00",
                    style: TextStyle(fontSize: 11),
                  ),
                  const Text(
                    "O Cenário Multiverso",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Autor name",
                    style: TextStyle(fontSize: 12, color: fromCssColor('grey')),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
