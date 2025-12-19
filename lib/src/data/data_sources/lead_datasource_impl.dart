import 'package:taraz_package_sample/src/core/helpers/api.dart';
import 'package:taraz_package_sample/src/data/data_sources/lead_datasource.dart';
import 'package:dio/dio.dart';

class LeadDatasourceImpl implements LeadDatasource {
  final Dio _dio;

  LeadDatasourceImpl(this._dio);

  @override
  Future<dynamic> create(Map<String, dynamic> body) async {
    return await _dio.post(Api.addLead, data: body);
  }

  @override
  Future<dynamic> getList() async {
    final response =  await  _dio.get(Api.getLeads);
    return response.data;
  }
}
