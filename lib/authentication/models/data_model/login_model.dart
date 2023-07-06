// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.location,
    this.phone,
    this.emailVerifiedAt,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
  });

  int? id;
  String? name;
  String? email;
  String? location;
  String? phone;
  dynamic emailVerifiedAt;
  String? role;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "access_token": accessToken,
      };
}
