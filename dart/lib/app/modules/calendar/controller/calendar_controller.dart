import 'dart:convert';
import 'package:chuva_dart/app/models/data_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class CalendarController extends GetxController {
  @override
  void onInit() {
    getPapers();
    super.onInit();
  }

  final dio = Dio();
  final listData = <Data>[].obs;
  final currentDate = DateTime(2023, 11, 26).obs;

  void getPapers() async {
    final response = await dio.get(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2024/master/dart/assets/activities.json');

    final decoded = DataModel.fromJson(json.decode(response.data));

    final response2 = await dio.get(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2024/master/dart/assets/activities-1.json');

    final decoded2 = DataModel.fromJson(json.decode(response2.data));

    //decoded2

    listData.clear();
    listData.addAll(decoded.data);
    listData.addAll(decoded2.data);
  }

  void changeDate(DateTime newDate) {
    currentDate.value = newDate;
  }
}
