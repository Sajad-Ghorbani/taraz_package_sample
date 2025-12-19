import 'package:get/get.dart';
import 'package:taraz_package_sample/src/injection_container.dart';
import 'package:taraz_package_sample/src/presentation/leads/controllers/leads_controller.dart';

class LeadsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeadsController>(() => LeadsController(leadSL()));
  }
}
