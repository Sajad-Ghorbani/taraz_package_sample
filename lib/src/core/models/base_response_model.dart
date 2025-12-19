import 'package:taraz_package_sample/src/core/models/response_message_model.dart';

class BaseResponse {
  final int? statusCode;
  final ResponseMessage? message;
  final dynamic data;

  BaseResponse({this.statusCode, this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(statusCode: json['statusCode'], message: ResponseMessage.fromJson(json['message']), data: json['data']);

  Map<String, dynamic> toJson() => {'statusCode': statusCode, 'message': message?.toJson(), 'data': data};
}
