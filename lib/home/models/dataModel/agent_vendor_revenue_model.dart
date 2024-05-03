// To parse this JSON data, do
//
//     final agentVendorRevenueModel = agentVendorRevenueModelFromJson(jsonString);

import 'dart:convert';

AgentVendorRevenueModel agentVendorRevenueModelFromMap(
        Map<String, dynamic> str) =>
    AgentVendorRevenueModel.fromJson(str);

String agentVendorRevenueModelToJson(AgentVendorRevenueModel data) =>
    json.encode(data.toJson());

class AgentVendorRevenueModel {
  bool success;
  Data data;
  String message;

  AgentVendorRevenueModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentVendorRevenueModel.fromJson(Map<String, dynamic> json) =>
      AgentVendorRevenueModel(
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
  dynamic totalAmount;
  dynamic lastMonthEarning;
  dynamic lastMonthName;

  Data({
    required this.totalAmount,
    required this.lastMonthEarning,
    required this.lastMonthName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalAmount: json["total_amount"],
        lastMonthEarning: json["last_month_earning"],
        lastMonthName: json["last_month_name"],
      );

  Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "last_month_earning": lastMonthEarning,
        "last_month_name": lastMonthName,
      };
}
