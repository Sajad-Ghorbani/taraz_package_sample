class ResponseMessage {
  final String? text;
  final String? type;
  final int? code;

  ResponseMessage({this.text, this.type, this.code});

  factory ResponseMessage.fromJson(Map<String, dynamic> json) => ResponseMessage(text: json['text'], type: json['type'], code: json['code']);

  Map<String, dynamic> toJson() => {'text': text, 'type': type, 'code': code};
}
