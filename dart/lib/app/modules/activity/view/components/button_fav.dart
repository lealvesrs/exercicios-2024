import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:flutter/material.dart';

class ButtonFav extends StatefulWidget {
  const ButtonFav({super.key});

  @override
  State<ButtonFav> createState() => _ButtonFavState();
}

class _ButtonFavState extends State<ButtonFav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColor.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // <-- Radius
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: MyColor.white,
                size: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Adiconar à sua agenda",
                  style: TextStyle(color: MyColor.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
