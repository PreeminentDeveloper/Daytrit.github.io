// To parse this JSON data, do
//
//     final agentVendorOrderModel = agentVendorOrderModelFromJson(jsonString);

import 'dart:convert';

AgentVendorOrderModel agentVendorOrderModelFromMap(Map<String, dynamic> str) =>
    AgentVendorOrderModel.fromJson(str);

String agentVendorOrderModelToJson(AgentVendorOrderModel data) =>
    json.encode(data.toJson());

class AgentVendorOrderModel {
  bool success;
  Data data;
  String message;

  AgentVendorOrderModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentVendorOrderModel.fromJson(Map<String, dynamic> json) =>
      AgentVendorOrderModel(
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
  dynamic currentPage;
  List<Datum> data;
  String firstPageUrl;
  dynamic from;
  dynamic lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int id;
  String productId;
  String userId;
  String amount;
  String status;
  String details;
  String bookingId;
  DateTime createdAt;
  DateTime updatedAt;
  Vendor vendor;

  Datum({
    required this.id,
    required this.productId,
    required this.userId,
    required this.amount,
    required this.status,
    required this.details,
    required this.bookingId,
    required this.createdAt,
    required this.updatedAt,
    required this.vendor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        amount: json["amount"],
        status: json["status"],
        details: json["details"],
        bookingId: json["booking_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendor: Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "amount": amount,
        "status": status,
        "details": details,
        "booking_id": bookingId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "vendor": vendor.toJson(),
      };
}

class Vendor {
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
  String cashPrice;
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

  Vendor({
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

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
