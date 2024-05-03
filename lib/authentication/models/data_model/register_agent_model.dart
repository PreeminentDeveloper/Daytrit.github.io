// To parse this JSON data, do
//
//     final registerAgentModel = registerAgentModelFromJson(jsonString);

import 'dart:convert';

RegisterAgentModel registerAgentModelFromJson(String str) =>
    RegisterAgentModel.fromJson(json.decode(str));

String registerAgentModelToJson(RegisterAgentModel data) =>
    json.encode(data.toJson());

class RegisterAgentModel {
  bool success;
  Data data;
  String message;

  RegisterAgentModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory RegisterAgentModel.fromJson(Map<String, dynamic> json) =>
      RegisterAgentModel(
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
  String name;
  String email;
  String phone;
  String address;
  String idCardNumber;
  String idCardType;
  String company;
  String location;
  String idCardPhoto;
  String companyCertificate;
  int referralCode;
  dynamic refereeCode;
  String role;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String accessToken;

  Data({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.idCardNumber,
    required this.idCardType,
    required this.company,
    required this.location,
    required this.idCardPhoto,
    required this.companyCertificate,
    required this.referralCode,
    required this.refereeCode,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        idCardNumber: json["id_card_number"],
        idCardType: json["id_card_type"],
        company: json["company"],
        location: json["location"],
        idCardPhoto: json["id_card_photo"],
        companyCertificate: json["company_certificate"],
        referralCode: json["referral_code"],
        refereeCode: json["referee_code"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "id_card_number": idCardNumber,
        "id_card_type": idCardType,
        "company": company,
        "location": location,
        "id_card_photo": idCardPhoto,
        "company_certificate": companyCertificate,
        "referral_code": referralCode,
        "referee_code": refereeCode,
        "role": role,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "access_token": accessToken,
      };
}
