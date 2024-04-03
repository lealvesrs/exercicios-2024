import 'package:chuva_dart/app/modules/calendar/controller/calendar_controller.dart';
import 'package:get/get.dart';

class CalendarBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}
