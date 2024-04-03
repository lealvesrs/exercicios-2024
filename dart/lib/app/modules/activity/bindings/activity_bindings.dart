import 'package:chuva_dart/app/modules/activity/controller/activity_controller.dart';
import 'package:get/get.dart';

class ActivityBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivityController());
  }
}
