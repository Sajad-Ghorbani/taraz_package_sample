import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taraz_package_sample/src/data/data_sources/lead_data_source_impl.dart';
import 'package:taraz_package_sample/taraz_package_sample.dart';

final leadSL = GetIt.instance;

void leadInit() {
  leadSL.registerLazySingleton<LeadDatasource>(() => LeadDatasourceImpl(Dio()));

  leadSL.registerLazySingleton<LeadRepository>(() => LeadRepository(leadSL()));
}
