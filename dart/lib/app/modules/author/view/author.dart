import 'package:chuva_dart/app/modules/author/view/components/card_author.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/card_paper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/my_color.dart';

class Author extends StatelessWidget {
  const Author({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
                color: MyColor.white,
                onPressed: () {
                  context.go("/activity");
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CardAuthor(),
            Text(
              "Atividades",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColor.gray),
            ),
            Text(
              "dom.,26/11/2023",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColor.gray),
            ),
            const CardPaper()
          ]),
        ));
  }
}
