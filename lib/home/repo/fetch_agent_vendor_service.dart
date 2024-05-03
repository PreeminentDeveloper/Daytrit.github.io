import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_model.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_order_model.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_revenue_model.dart';
import 'package:daytrit/utils/url_paths.dart';
import '../../utils/network_handler.dart';

class FetchAgentVendorService {
  NetworkHandler networkHandler = NetworkHandler();

  static getAgentVendors() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler
          .getWithToken(TravelAgencyUrl.getTravelAgencyVendor);
      decodedData = response;
      print("my-vendor: $response");
      return Success(data: agentVendorModelFromMap(response));
    } on SocketException catch (_) {
      return VendorFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return NotifcationFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return NotifcationFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);

      return NotifcationFetchFailure(message: "${decodedData?['message']}");
    }
  }

  static getAgentOrders() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler
          .getWithToken(TravelAgencyUrl.getTravelAgencyOrder);
      decodedData = response;
      print("my-order: $response");
      return Success(data: agentVendorOrderModelFromMap(response));
      // return Success(data: response);
    } on SocketException catch (_) {
      return VendorFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return NotifcationFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return NotifcationFetchFailure(message: "Invalid Format");
    } catch (e) {
      print("order-error: $e");

      return NotifcationFetchFailure(message: "${decodedData?['message']}");
    }
  }

  static getAgentRevenue() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler
          .getWithToken(TravelAgencyUrl.getTravelAgencyRevenue);
      decodedData = response;
      print("my-revenue: $response");
      return Success(data: agentVendorRevenueModelFromMap(response));
    } on SocketException catch (_) {
      return VendorFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return NotifcationFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return NotifcationFetchFailure(message: "Invalid Format");
    } catch (e) {
      print("err: $e");

      return NotifcationFetchFailure(message: "${decodedData?['message']}");
    }
  }
}
