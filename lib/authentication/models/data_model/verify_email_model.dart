// To parse this JSON data, do
//
//     final verifyEmailModel = verifyEmailModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) =>
    VerifyEmailModel.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyEmailModel data) =>
    json.encode(data.toJson());

class VerifyEmailModel {
  VerifyEmailModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      VerifyEmailModel(
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
    this.referralCode,
    this.refereeCode,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? location;
  String? phone;
  DateTime? emailVerifiedAt;
  String? role;
  String? status;
  String? referralCode;
  dynamic refereeCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        role: json["role"],
        status: json["status"],
        referralCode: json["referral_code"],
        refereeCode: json["referee_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "role": role,
        "status": status,
        "referral_code": referralCode,
        "referee_code": refereeCode,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
