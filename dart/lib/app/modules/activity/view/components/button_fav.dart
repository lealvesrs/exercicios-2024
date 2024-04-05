import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:chuva_dart/app/modules/activity/view/components/title_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../calendar/controller/calendar_controller.dart';

class ButtonFav extends StatefulWidget {
  const ButtonFav({super.key});

  @override
  State<ButtonFav> createState() => _ButtonFavState();
}

class _ButtonFavState extends State<ButtonFav> {
  final controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                controller.changeFavorite();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.isLoading.value
                    ? MyColor.lightgray
                    : MyColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: controller.isLoading.value
                  ? TitleButton(
                      title: "Carregando",
                      color: MyColor.gray,
                      icon: Icons.refresh,
                    )
                  : !controller.isFavorite(controller.paper.id)
                      ? TitleButton(
                          title: "Adiconar à sua agenda",
                          color: MyColor.white,
                          icon: Icons.star,
                        )
                      : TitleButton(
                          title: "Remover da sua agenda",
                          color: MyColor.white,
                          icon: Icons.star_border_outlined,
                        )),
        ),
      );
    });
  }
}
