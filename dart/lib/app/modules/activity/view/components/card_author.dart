import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:flutter/material.dart';

class CardAuthor extends StatelessWidget {
  const CardAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                const Text("Stephen William"),
                Text(
                  "Stephen William",
                  style: TextStyle(fontSize: 14, color: MyColor.gray),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
