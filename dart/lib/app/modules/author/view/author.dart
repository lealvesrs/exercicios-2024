import 'package:chuva_dart/app/modules/author/view/components/card_author.dart';
import 'package:chuva_dart/app/modules/calendar/controller/calendar_controller.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/card_paper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/my_color.dart';

class Author extends StatelessWidget {
  const Author({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CardAuthor(
                id: controller.author.id,
                image: controller.author.picture ?? "",
                institution: controller.author.institution ?? "",
                name: controller.author.name,
                isAuthorPage: true,
                onTap: () {},
              ),
              Text(
                "Bio",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyColor.gray),
              ),
              Text(
                controller.author.bio.ptBr ?? "",
              ),
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
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.activiesAuthor.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.activiesAuthor[index];
                    return CardPaper(
                      item: item,
                      title: item.title.ptBr ?? "",
                      color: item.category.color ?? "red",
                      info:
                          "${item.type.title.ptBr} de ${controller.formatTime(item.start)} até ${controller.formatTime(item.end)}",
                      author: controller.formatAuthor(item.people),
                    );
                  })
            ]),
          ),
        ));
  }
}
