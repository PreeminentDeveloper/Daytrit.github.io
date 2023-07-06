// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    int? id;
    String? userId;
    String? title;
    String? featureImage;
    String? description;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    NotificationModel({
        this.id,
        this.userId,
        this.title,
        this.featureImage,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    NotificationModel copyWith({
        int? id,
        String? userId,
        String? title,
        String? featureImage,
        String? description,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        NotificationModel(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            title: title ?? this.title,
            featureImage: featureImage ?? this.featureImage,
            description: description ?? this.description,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        featureImage: json["feature_image"],
        description: json["description"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "feature_image": featureImage,
        "description": description,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
