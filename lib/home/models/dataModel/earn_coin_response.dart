// To parse this JSON data, do
//
//     final earnCoinResponse = earnCoinResponseFromMap(jsonString);

import 'dart:convert';

EarnCoinResponse earnCoinResponseFromMap(String str) => EarnCoinResponse.fromMap(json.decode(str));

String earnCoinResponseToMap(EarnCoinResponse data) => json.encode(data.toMap());

class EarnCoinResponse {
  EarnCoinResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  EarnCoinResponse copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      EarnCoinResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory EarnCoinResponse.fromMap(Map<String, dynamic> json) => EarnCoinResponse(
    success: json["success"],
    data: Data.fromMap(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": data.toMap(),
    "message": message,
  };
}

class Data {
  Data({
    required this.userId,
    required this.amount,
    required this.type,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  int userId;
  int amount;
  String type;
  String description;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data copyWith({
    int? userId,
    int? amount,
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

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    amount: json["amount"],
    type: json["type"],
    description: json["description"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "amount": amount,
    "type": type,
    "description": description,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id.toString(),
  };
}
