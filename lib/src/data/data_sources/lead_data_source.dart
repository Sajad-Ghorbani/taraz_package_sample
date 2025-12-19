abstract class LeadDatasource {
  Future<dynamic> getLeads();
  Future<dynamic> create(Map<String, dynamic> body);
}