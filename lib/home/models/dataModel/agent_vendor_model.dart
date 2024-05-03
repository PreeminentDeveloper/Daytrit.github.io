// To parse this JSON data, do
//
//     final agentVendorModel = agentVendorModelFromJson(jsonString);

import 'dart:convert';

AgentVendorModel agentVendorModelFromMap(Map<String, dynamic> str) =>
    AgentVendorModel.fromJson(str);

String agentVendorModelToJson(AgentVendorModel data) =>
    json.encode(data.toJson());

class AgentVendorModel {
  bool success;
  List<MyVendor> data;
  String message;

  AgentVendorModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentVendorModel.fromJson(Map<String, dynamic> json) =>
      AgentVendorModel(
        success: json["success"],
        data:
            List<MyVendor>.from(json["data"].map((x) => MyVendor.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class MyVendor {
  int id;
  String title;
  String category;
  String state;
  String country;
  dynamic address;
  String rating;
  String photo;
  String photo2;
  String photo3;
  String photo4;
  dynamic coinPrice;
  dynamic cashPrice;
  String description;
  String features;
  String type;
  String paymentMethod;
  String requiredCheckoutField;
  dynamic dateOfEvent;
  dynamic isAnEvent;
  dynamic timeForEvent;
  dynamic eventVenue;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  MyVendor({
    required this.id,
    required this.title,
    required this.category,
    required this.state,
    required this.country,
    required this.address,
    required this.rating,
    required this.photo,
    required this.photo2,
    required this.photo3,
    required this.photo4,
    required this.coinPrice,
    required this.cashPrice,
    required this.description,
    required this.features,
    required this.type,
    required this.paymentMethod,
    required this.requiredCheckoutField,
    required this.dateOfEvent,
    required this.isAnEvent,
    required this.timeForEvent,
    required this.eventVenue,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyVendor.fromJson(Map<String, dynamic> json) => MyVendor(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        state: json["state"],
        country: json["country"],
        address: json["address"],
        rating: json["rating"],
        photo: json["photo"],
        photo2: json["photo_2"],
        photo3: json["photo_3"],
        photo4: json["photo_4"],
        coinPrice: json["coin_price"],
        cashPrice: json["cash_price"],
        description: json["description"],
        features: json["features"],
        type: json["type"],
        paymentMethod: json["payment_method"],
        requiredCheckoutField: json["required_checkout_field"],
        dateOfEvent: json["date_of_event"],
        isAnEvent: json["is_an_event"],
        timeForEvent: json["time_for_event"],
        eventVenue: json["event_venue"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "state": state,
        "country": country,
        "address": address,
        "rating": rating,
        "photo": photo,
        "photo_2": photo2,
        "photo_3": photo3,
        "photo_4": photo4,
        "coin_price": coinPrice,
        "cash_price": cashPrice,
        "description": description,
        "features": features,
        "type": type,
        "payment_method": paymentMethod,
        "required_checkout_field": requiredCheckoutField,
        "date_of_event": dateOfEvent,
        "is_an_event": isAnEvent,
        "time_for_event": timeForEvent,
        "event_venue": eventVenue,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
