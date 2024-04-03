import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:chuva_dart/app/modules/activity/view/components/button_fav.dart';
import 'package:chuva_dart/app/modules/activity/view/components/card_author.dart';
import 'package:chuva_dart/app/modules/activity/view/components/text_info.dart';
import 'package:flutter/material.dart';
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
              color: MyColor.white,
              onPressed: () {
                context.go("/");
              }),
          centerTitle: true,
          backgroundColor: MyColor.darkBlue,
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Chuva ❤️ Flutter',
              style: TextStyle(color: MyColor.white),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: MyColor.white,
            height: 35,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Astrobiologia e Vida",
                style: TextStyle(color: MyColor.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Vida aém da terra: uma perpspectiva astrobiologica",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const TextInfo(
                    title: "Domingo 08:00h - 09:00h",
                    icon: Icons.query_builder),
                const TextInfo(title: "Pretória", icon: Icons.location_on),
                const ButtonFav(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dictum, nulla non tempor bibendum, urna dolor convallis erat, maximus auctor dolor sapien nec leo. Maecenas porta interdum sapien, eget pulvinar arcu. Aenean et faucibus justo. Integer felis justo, gravida a mattis nec, ultricies nec lectus. Donec blandit ornare neque at egestas. "),
                ),
                Text(
                  "Palestrante",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColor.gray),
                ),
                const CardAuthor()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
