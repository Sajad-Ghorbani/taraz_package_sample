import 'package:taraz_package_sample/src/core/helpers/utils.dart';
import 'package:taraz_package_sample/src/core/models/base_response_model.dart';
import 'package:taraz_package_sample/src/core/models/paginated_response_model.dart';
import 'package:taraz_package_sample/src/core/models/response_message_model.dart';
import 'package:taraz_package_sample/src/data/data_sources/lead_data_source.dart';
import 'package:taraz_package_sample/src/data/models/lead_model.dart';

class LeadRepository {
  final LeadDatasource _leadDatasource;

  LeadRepository(this._leadDatasource);

  Future<PaginatedResponse<VMLead>?> getLeads() async {
    final response = await _leadDatasource.getLeads();
    final apiResult = BaseResponse.fromJson(response);
    AppUtils.checkMessage(message: apiResult.message ?? ResponseMessage());
    return PaginatedResponse.fromJson(apiResult.data, (json) => VMLead.fromJson(json));
  }

  Future<BaseResponse?> create(VMLead body) async {
    final response = await _leadDatasource.create(body.toJson());
    final apiResult = BaseResponse.fromJson(response);
    AppUtils.checkMessage(message: apiResult.message ?? ResponseMessage());
    return apiResult;
  }
}
