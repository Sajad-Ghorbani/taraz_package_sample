import 'package:get/get.dart';
import 'package:taraz_package_sample/src/presentation/lead/controllers/lead_controller.dart';

class LeadControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeadController>(() => LeadController());
  }
}