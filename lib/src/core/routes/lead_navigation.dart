
import 'package:get/get.dart';
import 'package:taraz_package_sample/src/core/routes/lead_routes.dart';
import 'package:taraz_package_sample/src/presentation/bindings/controller_bindings.dart';
import 'package:taraz_package_sample/src/presentation/screens.dart';

class LeadNav {
  static List<GetPage> routes = [
    GetPage(
      name: LeadRoutes.leads,
      page: () => const LeadsScreen(),
      binding: LeadsControllerBinding(),
    ),
    GetPage(
      name: LeadRoutes.lead,
      page: () => const LeadScreen(),
      binding: LeadControllerBinding(),
    ),
  ];
}
