// To parse this JSON data, do
//
//     final deleteAccountResponse = deleteAccountResponseFromJson(jsonString);

import 'dart:convert';

DeleteAccountResponse deleteAccountResponseFromJson(String str) =>
    DeleteAccountResponse.fromJson(json.decode(str));

String deleteAccountResponseToJson(DeleteAccountResponse data) =>
    json.encode(data.toJson());

class DeleteAccountResponse {
  DeleteAccountResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      DeleteAccountResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    required this.phone,
    required this.emailVerifiedAt,
    required this.role,
    required this.status,
    required this.referralCode,
    this.refereeCode,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String location;
  String phone;
  DateTime emailVerifiedAt;
  String role;
  int status;
  String referralCode;
  dynamic refereeCode;
  DateTime createdAt;
  DateTime updatedAt;

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
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "role": role,
        "status": status,
        "referral_code": referralCode,
        "referee_code": refereeCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
