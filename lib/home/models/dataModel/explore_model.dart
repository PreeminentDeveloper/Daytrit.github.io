// To parse this JSON data, do
//
//     final exploreModel = exploreModelFromJson(jsonString);

import 'dart:convert';

ExploreModel exploreModelFromJson(String str) =>
    ExploreModel.fromJson(json.decode(str));

String exploreModelToJson(ExploreModel data) => json.encode(data.toJson());

class ExploreModel {
  ExploreModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory ExploreModel.fromJson(Map<String, dynamic> json) => ExploreModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.thumbnail,
    required this.youtubeUrl,
    required this.description,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String thumbnail;
  String youtubeUrl;
  String description;
  String title;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        thumbnail: json["thumbnail"],
        youtubeUrl: json["youtube_url"],
        description: json["description"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "youtube_url": youtubeUrl,
        "description": description,
        "title": title,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
