// To parse this JSON data, do
//
//     final validateEmailModel = validateEmailModelFromJson(jsonString);

import 'dart:convert';

ValidateEmailModel validateEmailModelFromJson(String str) =>
    ValidateEmailModel.fromJson(json.decode(str));

String validateEmailModelToJson(ValidateEmailModel data) =>
    json.encode(data.toJson());

class ValidateEmailModel {
  ValidateEmailModel({
    required this.success,
    this.data,
    required this.message,
  });

  bool success;
  dynamic data;
  String message;

  factory ValidateEmailModel.fromJson(Map<String, dynamic> json) =>
      ValidateEmailModel(
        success: json["success"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
      };
}
