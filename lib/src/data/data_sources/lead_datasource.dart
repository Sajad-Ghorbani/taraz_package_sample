abstract class LeadDatasource {
  Future<dynamic> getList();
  Future<dynamic> create(Map<String, dynamic> body);
}