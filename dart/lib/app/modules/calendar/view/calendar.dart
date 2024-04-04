import 'package:chuva_dart/app/modules/calendar/controller/calendar_controller.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/calendar_bar.dart';
import 'package:chuva_dart/app/modules/calendar/view/components/card_paper.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: fromCssColor("#456189"),
        toolbarHeight: 130,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Chuva ❤️ Flutter',
            style: TextStyle(color: fromCssColor("white")),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Text(
                  "Programação",
                  style:
                      TextStyle(fontSize: 20, color: fromCssColor("lightgray")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: fromCssColor("white"),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                color: fromCssColor("#306dc3"),
                              ),
                              child: const Icon(Icons.calendar_month,
                                  color: Colors.black),
                            ),
                          ),
                          const Center(
                              child: Text("Exibindo todas atividades")),
                        ],
                      )),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CalendarBar(),
            Obx(() {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.filteredList[index];
                    return CardPaper(
                      item: item,
                      title: item.title.ptBr ?? "",
                      color: item.category.color ?? "red",
                      info:
                          "${item.type.title.ptBr} de ${controller.formatTime(item.start)} até ${controller.formatTime(item.end)}",
                      author: controller.formatAuthor(item.people),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
