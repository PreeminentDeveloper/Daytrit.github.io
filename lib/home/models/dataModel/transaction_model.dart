// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  dynamic id;
  dynamic amount;
  dynamic type;
  dynamic transactionId;
  dynamic description;
  dynamic status;
  dynamic bookingId;
  dynamic dateOfEvent;
  dynamic timeForEvent;
  dynamic eventVenue;
  dynamic eventStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  TransactionModel({
    this.id,
    this.amount,
    this.type,
    this.transactionId,
    this.description,
    this.status,
    this.bookingId,
    this.dateOfEvent,
    this.timeForEvent,
    this.eventVenue,
    this.eventStatus,
    this.createdAt,
    this.updatedAt,
  });

  TransactionModel copyWith({
    int? id,
    String? amount,
    String? type,
    dynamic transactionId,
    String? description,
    String? status,
    dynamic bookingId,
    dynamic dateOfEvent,
    dynamic timeForEvent,
    dynamic eventVenue,
    dynamic eventStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        transactionId: transactionId ?? this.transactionId,
        description: description ?? this.description,
        status: status ?? this.status,
        bookingId: bookingId ?? this.bookingId,
        dateOfEvent: dateOfEvent ?? this.dateOfEvent,
        timeForEvent: timeForEvent ?? this.timeForEvent,
        eventVenue: eventVenue ?? this.eventVenue,
        eventStatus: eventStatus ?? this.eventStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        amount: json["amount"],
        type: json["type"],
        transactionId: json["transaction_id"],
        description: json["description"],
        status: json["status"],
        bookingId: json["booking_id"],
        dateOfEvent: json["date_of_event"],
        timeForEvent: json["time_for_event"],
        eventVenue: json["event_venue"],
        eventStatus: json["event_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "type": type,
        "transaction_id": transactionId,
        "description": description,
        "status": status,
        "booking_id": bookingId,
        "date_of_event": dateOfEvent,
        "time_for_event": timeForEvent,
        "event_venue": eventVenue,
        "event_status": eventStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
