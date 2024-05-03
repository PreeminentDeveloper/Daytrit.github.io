// To parse this JSON data, do
//
//     final allStatusModel = allStatusModelFromJson(jsonString);

import 'dart:convert';

AllStatusModel allStatusModelFromJson(String str) =>
    AllStatusModel.fromJson(json.decode(str));

String allStatusModelToJson(AllStatusModel data) => json.encode(data.toJson());

class AllStatusModel {
  int? id;
  String? name;
  String? email;
  String? location;
  dynamic country;
  String? phone;
  DateTime? emailVerifiedAt;
  String? role;
  String? status;
  String? referralCode;
  dynamic refereeCode;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Status>? statuses;

  AllStatusModel({
    this.id,
    this.name,
    this.email,
    this.location,
    this.country,
    this.phone,
    this.emailVerifiedAt,
    this.role,
    this.status,
    this.referralCode,
    this.refereeCode,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.statuses,
  });

  AllStatusModel copyWith({
    int? id,
    String? name,
    String? email,
    String? location,
    dynamic country,
    String? phone,
    DateTime? emailVerifiedAt,
    String? role,
    String? status,
    String? referralCode,
    dynamic refereeCode,
    String? photo,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Status>? statuses,
  }) =>
      AllStatusModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        location: location ?? this.location,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        role: role ?? this.role,
        status: status ?? this.status,
        referralCode: referralCode ?? this.referralCode,
        refereeCode: refereeCode ?? this.refereeCode,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        statuses: statuses ?? this.statuses,
      );

  factory AllStatusModel.fromJson(Map<String, dynamic> json) => AllStatusModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        country: json["country"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        role: json["role"],
        status: json["status"],
        referralCode: json["referral_code"],
        refereeCode: json["referee_code"],
        photo: json["photo"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        statuses: json["statuses"] == null
            ? []
            : List<Status>.from(
                json["statuses"]!.map((x) => Status.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "location": location,
        "country": country,
        "phone": phone,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "role": role,
        "status": status,
        "referral_code": referralCode,
        "referee_code": refereeCode,
        "photo": photo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "statuses": statuses == null
            ? []
            : List<dynamic>.from(statuses!.map((x) => x.toJson())),
      };
}

class Status {
  int? id;
  String? userId;
  String? type;
  String? caption;
  String? fileUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  Status({
    this.id,
    this.userId,
    this.type,
    this.caption,
    this.fileUrl,
    this.createdAt,
    this.updatedAt,
  });

  Status copyWith({
    int? id,
    String? userId,
    String? type,
    String? caption,
    String? fileUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Status(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        caption: caption ?? this.caption,
        fileUrl: fileUrl ?? this.fileUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        caption: json["caption"],
        fileUrl: json["file_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "caption": caption,
        "file_url": fileUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
