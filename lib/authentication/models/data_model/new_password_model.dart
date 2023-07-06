// To parse this JSON data, do
//
//     final newPasswordModel = newPasswordModelFromJson(jsonString);

import 'dart:convert';

NewPasswordModel newPasswordModelFromJson(String str) =>
    NewPasswordModel.fromJson(json.decode(str));

String newPasswordModelToJson(NewPasswordModel data) =>
    json.encode(data.toJson());

class NewPasswordModel {
  NewPasswordModel({
    required this.success,
    this.data,
    required this.message,
  });

  bool success;
  dynamic data;
  String message;

  factory NewPasswordModel.fromJson(Map<String, dynamic> json) =>
      NewPasswordModel(
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
