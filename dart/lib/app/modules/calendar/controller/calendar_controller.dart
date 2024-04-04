import 'dart:convert';
import 'package:chuva_dart/app/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  @override
  void onInit() {
    getPapers();
    super.onInit();
  }

  final dio = Dio();
  final listData = <Data>[].obs;
  final filteredList = <Data>[].obs;
  final currentDate = DateTime(2023, 11, 26).obs;
  var dateFormat = DateFormat('yyyy-MM-dd');
  var currentDateFormat =
      DateFormat('yyyy-MM-dd').format(DateTime(2023, 11, 26));

  var id = 0;
  var desc = "";
  var authors = [];
  var local = "";
  var info = "";
  var title = "";
  var category = "";
  var color = "";

  void getPapers() async {
    final response = await dio.get(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2024/master/dart/assets/activities.json');

    final decoded = DataModel.fromJson(json.decode(response.data));

    final response2 = await dio.get(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2024/master/dart/assets/activities-1.json');

    final decoded2 = DataModel.fromJson(json.decode(response2.data));

    listData.clear();
    listData.addAll(decoded.data);
    listData.addAll(decoded2.data);
    filterList();
  }

  void changeDate(DateTime newDate) {
    currentDate.value = newDate;
    currentDateFormat = formatDate(currentDate.value);
    filterList();
  }

  void filterList() {
    filteredList.assignAll(listData.where((x) =>
        dateFormat.format(DateTime.parse(x.start)) == currentDateFormat));
  }

  String formatDate(date) {
    String formattedDate = dateFormat.format(date);

    return formattedDate;
  }

  String formatTime(timeString) {
    DateTime dateTime = DateTime.parse(timeString);

    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return formattedTime;
  }

  String formatAuthor(authors) {
    if (authors != []) {
      String authorsString = "";
      for (int i = 0; i < authors.length; i++) {
        i == authors.length - 1
            ? authorsString += authors[i].name
            : authorsString += authors[i].name + ", ";
      }
      return authorsString;
    } else {
      return "";
    }
  }

  void teste(Data item) {
    id = item.id;
    desc = item.description.ptBr ?? "";
    title = item.title.ptBr ?? "";
    authors = item.people;
    local = item.locations[0].title.ptBr ?? "";
    category = item.category.title.ptBr ?? "";
    color = item.category.color ?? "";
    String dayOfWeek = DateFormat('EEEE').format(DateTime.parse(item.start));

    debugPrint(dayOfWeek.toString());
    info = "${formatTime(item.start)}h - ${formatTime(item.end)}h";
  }
}
