// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  bool? success;
  Data? data;
  String? message;

  StatusModel({
    this.success,
    this.data,
    this.message,
  });

  StatusModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      StatusModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? fileUrl;
  int? userId;
  String? type;
  String? caption;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.fileUrl,
    this.userId,
    this.type,
    this.caption,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data copyWith({
    String? fileUrl,
    int? userId,
    String? type,
    String? caption,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Data(
        fileUrl: fileUrl ?? this.fileUrl,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        caption: caption ?? this.caption,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fileUrl: json["file_url"],
        userId: json["user_id"],
        type: json["type"],
        caption: json["caption"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "file_url": fileUrl,
        "user_id": userId,
        "type": type,
        "caption": caption,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
