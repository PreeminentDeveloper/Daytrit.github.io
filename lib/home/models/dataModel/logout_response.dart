// To parse this JSON data, do
//
//     final fetchHomeDataResponse = fetchHomeDataResponseFromMap(jsonString);

import 'dart:convert';

LogOutResponse logOutResponseFromMap(String str) => LogOutResponse.fromMap(json.decode(str));

String logOutResponseToMap(LogOutResponse data) => json.encode(data.toMap());

class LogOutResponse {
  LogOutResponse({
    required this.message,
  });

  String message;

  LogOutResponse copyWith({
    String? message,
  }) =>
      LogOutResponse(
        message: message ?? this.message,
      );

  factory LogOutResponse.fromMap(Map<String, dynamic> json) => LogOutResponse(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
