import 'package:flutter/material.dart';

import '../../../../helper/my_color.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: MyColor.blue,
          size: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            title,
          ),
        ),
      ],
    );
  }
}
