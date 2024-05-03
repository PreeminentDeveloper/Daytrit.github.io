// To parse this JSON data, do
//
//     final createTravelVendorModel = createTravelVendorModelFromJson(jsonString);

import 'dart:convert';

CreateTravelVendorModel createTravelVendorModelFromMap(
        Map<String, dynamic> str) =>
    CreateTravelVendorModel.fromJson(str);

String createTravelVendorModelToJson(CreateTravelVendorModel data) =>
    json.encode(data.toJson());

class CreateTravelVendorModel {
  bool success;
  Data data;
  String message;

  CreateTravelVendorModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CreateTravelVendorModel.fromJson(Map<String, dynamic> json) =>
      CreateTravelVendorModel(
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
  String title;
  String description;
  String state;
  String features;
  String country;
  dynamic coinPrice;
  String cashPrice;
  String type;
  String category;
  String paymentMethod;
  dynamic isAnEvent;
  dynamic dateOfEvent;
  dynamic timeForEvent;
  dynamic eventVenue;
  int userId;
  String requiredCheckoutField;
  String photo;
  String photo2;
  String photo3;
  String photo4;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.title,
    required this.description,
    required this.state,
    required this.features,
    required this.country,
    required this.coinPrice,
    required this.cashPrice,
    required this.type,
    required this.category,
    required this.paymentMethod,
    required this.isAnEvent,
    required this.dateOfEvent,
    required this.timeForEvent,
    required this.eventVenue,
    required this.userId,
    required this.requiredCheckoutField,
    required this.photo,
    required this.photo2,
    required this.photo3,
    required this.photo4,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        description: json["description"],
        state: json["state"],
        features: json["features"],
        country: json["country"],
        coinPrice: json["coin_price"],
        cashPrice: json["cash_price"],
        type: json["type"],
        category: json["category"],
        paymentMethod: json["payment_method"],
        isAnEvent: json["is_an_event"],
        dateOfEvent: json["date_of_event"],
        timeForEvent: json["time_for_event"],
        eventVenue: json["event_venue"],
        userId: json["user_id"],
        requiredCheckoutField: json["required_checkout_field"],
        photo: json["photo"],
        photo2: json["photo_2"],
        photo3: json["photo_3"],
        photo4: json["photo_4"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "state": state,
        "features": features,
        "country": country,
        "coin_price": coinPrice,
        "cash_price": cashPrice,
        "type": type,
        "category": category,
        "payment_method": paymentMethod,
        "is_an_event": isAnEvent,
        "date_of_event": dateOfEvent,
        "time_for_event": timeForEvent,
        "event_venue": eventVenue,
        "user_id": userId,
        "required_checkout_field": requiredCheckoutField,
        "photo": photo,
        "photo_2": photo2,
        "photo_3": photo3,
        "photo_4": photo4,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
