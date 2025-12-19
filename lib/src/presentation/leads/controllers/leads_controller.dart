import 'package:get/get.dart';
import 'package:taraz_package_sample/src/core/models/paginated_response_model.dart';
import 'package:taraz_package_sample/taraz_package_sample.dart';

class LeadsController extends GetxController {
  final LeadRepository _leadRepository;

  LeadsController(this._leadRepository);

  Future<PaginatedResponse<VMLead>?> getLeads() async {
    return await _leadRepository.getLeads();
  }
}
