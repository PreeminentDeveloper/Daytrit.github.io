// To parse this JSON data, do
//
//     final agentLoginModel = agentLoginModelFromJson(jsonString);

import 'dart:convert';

AgentLoginModel agentLoginModelFromJson(String str) =>
    AgentLoginModel.fromJson(json.decode(str));

String agentLoginModelToJson(AgentLoginModel data) =>
    json.encode(data.toJson());

class AgentLoginModel {
  bool success;
  Data data;
  String message;

  AgentLoginModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentLoginModel.fromJson(Map<String, dynamic> json) =>
      AgentLoginModel(
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
  int id;
  String name;
  String email;
  String location;
  dynamic country;
  String phone;
  dynamic emailVerifiedAt;
  String role;
  String status;
  String referralCode;
  dynamic refereeCode;
  dynamic photo;
  String companyCertificate;
  String idCardPhoto;
  String idCardNumber;
  String idCardType;
  String address;
  String company;
  DateTime createdAt;
  DateTime updatedAt;
  String accessToken;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    required this.country,
    required this.phone,
    required this.emailVerifiedAt,
    required this.role,
    required this.status,
    required this.referralCode,
    required this.refereeCode,
    required this.photo,
    required this.companyCertificate,
    required this.idCardPhoto,
    required this.idCardNumber,
    required this.idCardType,
    required this.address,
    required this.company,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        country: json["country"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        status: json["status"],
        referralCode: json["referral_code"],
        refereeCode: json["referee_code"],
        photo: json["photo"],
        companyCertificate: json["company_certificate"],
        idCardPhoto: json["id_card_photo"],
        idCardNumber: json["id_card_number"],
        idCardType: json["id_card_type"],
        address: json["address"],
        company: json["company"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "location": location,
        "country": country,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "status": status,
        "referral_code": referralCode,
        "referee_code": refereeCode,
        "photo": photo,
        "company_certificate": companyCertificate,
        "id_card_photo": idCardPhoto,
        "id_card_number": idCardNumber,
        "id_card_type": idCardType,
        "address": address,
        "company": company,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "access_token": accessToken,
      };
}
