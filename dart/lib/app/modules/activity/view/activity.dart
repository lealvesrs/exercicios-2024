import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:chuva_dart/app/modules/activity/view/components/button_fav.dart';
import 'package:chuva_dart/app/modules/author/view/components/card_author.dart';
import 'package:chuva_dart/app/modules/activity/view/components/text_info.dart';
import 'package:chuva_dart/app/modules/calendar/controller/calendar_controller.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/card_paper.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final controller = Get.put(CalendarController());

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
            color: fromCssColor(controller.color),
            height: 35,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.category,
                style: TextStyle(color: MyColor.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                TextInfo(title: controller.info, icon: Icons.query_builder),
                TextInfo(title: controller.local, icon: Icons.location_on),
                const ButtonFav(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(controller.desc),
                ),
                Text(
                  controller.authors.isNotEmpty
                      ? controller.authors[0].role.label.ptBr
                      : controller.subactivities.isNotEmpty
                          ? "Sub-atividades"
                          : "",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColor.gray),
                ),
                Visibility(
                  visible: controller.subactivities.isNotEmpty,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.subactivities.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.subactivities[index];
                        return CardPaper(
                          item: item,
                          title: item.title.ptBr ?? "",
                          color: item.category.color ?? "red",
                          info:
                              "${item.type.title.ptBr} de ${controller.formatTime(item.start)} até ${controller.formatTime(item.end)}",
                          author: controller.formatAuthor(item.people),
                        );
                      }),
                ),
                Visibility(
                  visible: controller.authors.isNotEmpty,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.authors.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.authors[index];
                        return CardAuthor(
                          onTap: () {
                            context.go('/author');
                            controller.author = item;
                            controller.getActivitiesAuthor();
                          },
                          isAuthorPage: false,
                          id: item.id,
                          name: item.name,
                          institution: item.institution ?? "",
                          image: item.picture ?? "",
                        );
                      }),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
