import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../authentication/repo/api_status.dart';
import '../../utils/url_paths.dart';
import '../model/vendor_model.dart';
import 'package:daytrit/utils/network_handler.dart';

class VendorService {
  Future<ApiResponse> getVendors() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.getWithToken(VendorUrls.vendorList);
      decodedData = response;
      List<dynamic> ls = response['data']['data'];
      return Success(data: ls.map((e) => VendorModel.fromJson(e)).toList());
    } on SocketException catch (_) {
      return VendorFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return VendorFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return VendorFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);

      return VendorFetchFailure(message: "${decodedData?['message']}");
    }
  }

  Future<ApiResponse> order(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    var response;
    try {
      response = await networkHandler.post("/user/order", body: data);
      print("ORDER RESPONSE FROM SERVICE: $response");
      var rep = jsonDecode(response.body);
      print("ORDER DECODED RESPONSE FROM SERVICE: $rep");

      if (rep['success'] != true) {
        return VendorFetchFailure(message: rep['message']);
      }
      return VendorSuccess(data: jsonDecode(response.body)['data']);
    } on SocketException catch (_) {
      return VendorFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return VendorFetchFailure(message: "Request Timeout.");
    } on FormatException {
      return VendorFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e.toString());
      return VendorFetchFailure(message: response.toString());
    }
  }
}
