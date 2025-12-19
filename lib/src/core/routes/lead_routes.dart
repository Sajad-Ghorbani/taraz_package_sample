class LeadRoutes {
  static Future<String> get initialRoute async {
    return leads;
  }

  static const home = '/home';
  static const lead = '/lead/info';
  static const leads = '/lead/index';
  static const importToExcel = '/import-excel/index';
}
