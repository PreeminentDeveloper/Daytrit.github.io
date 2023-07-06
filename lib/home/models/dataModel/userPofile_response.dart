// To parse this JSON data, do
//
//     final userProfileResponse = userProfileResponseFromMap(jsonString);

import 'dart:convert';

UserProfileResponse userProfileResponseFromMap(String str) =>
    UserProfileResponse.fromMap(json.decode(str));

String userProfileResponseToMap(UserProfileResponse data) =>
    json.encode(data.toMap());

class UserProfileResponse {
  UserProfileResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  UserData data;
  String message;

  UserProfileResponse copyWith({
    bool? success,
    UserData? data,
    String? message,
  }) =>
      UserProfileResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UserProfileResponse.fromMap(Map<String, dynamic> json) =>
      UserProfileResponse(
        success: json["success"],
        data: UserData.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
        "message": message,
      };
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    required this.country,
    required this.phone,
   this.photo,
    required this.emailVerifiedAt,
    required this.role,
    required this.status,
    required this.referralCode,
    required this.refereeCode,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String location;
  String phone;
  String? photo;
  dynamic country;
  dynamic emailVerifiedAt;
  String role;
  String status;
  String referralCode;
  dynamic refereeCode;
  DateTime createdAt;
  DateTime updatedAt;

  UserData copyWith({
    int? id,
    String? name,
    String? email,
    String? location,
    String? phone,
    String? photo,
    dynamic country,
    dynamic emailVerifiedAt,
    String? role,
    String? status,
    String? referralCode,
    dynamic refereeCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        location: location ?? this.location,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        photo: photo ?? this.photo,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        role: role ?? this.role,
        status: status ?? this.status,
        referralCode: referralCode ?? this.referralCode,
        refereeCode: refereeCode ?? this.refereeCode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        country: json["country"],
        phone: json["phone"],
        photo: json["photo"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        status: json["status"],
        referralCode: json["referral_code"],
        refereeCode: json["referee_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "photo": photo,
        "country": country,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "status": status,
        "referral_code": referralCode,
        "referee_code": refereeCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
