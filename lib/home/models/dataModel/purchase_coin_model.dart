// To parse this JSON data, do
//
//     final purchaseCoinModel = purchaseCoinModelFromJson(jsonString);

import 'dart:convert';

PurchaseCoinModel purchaseCoinModelFromJson(String str) =>
    PurchaseCoinModel.fromJson(json.decode(str));

String purchaseCoinModelToJson(PurchaseCoinModel data) =>
    json.encode(data.toJson());

class PurchaseCoinModel {
  bool? success;
  Data? data;
  String? message;

  PurchaseCoinModel({
    this.success,
    this.data,
    this.message,
  });

  PurchaseCoinModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      PurchaseCoinModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PurchaseCoinModel.fromJson(Map<String, dynamic> json) =>
      PurchaseCoinModel(
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
  int? userId;
  String? amount;
  String? type;
  String? description;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.userId,
    this.amount,
    this.type,
    this.description,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data copyWith({
    int? userId,
    String? amount,
    String? type,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Data(
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        description: description ?? this.description,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        amount: json["amount"],
        type: json["type"],
        description: json["description"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "amount": amount,
        "type": type,
        "description": description,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
