import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/create_travel_vendor_model.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class AddTravelVendorService {
  static addTravelVendor(
      title,
      category,
      state,
      paymentMethod,
      cashPrice,
      requiredCheckoutField,
      rating,
      type,
      country,
      address,
      description,
      features,
      photo) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postVendor(
          TravelAgencyUrl.addTravelVendor,
          title,
          category,
          state,
          paymentMethod,
          cashPrice,
          requiredCheckoutField.toString(),
          rating,
          type,
          country,
          address,
          description,
          features,
          photo);
      print("RESP-SERVICE: $response");
      // print("RESP-SERVICE: ${response.body}");
      // decodedData = jsonDecode(response.body);
      // decodedData = jsonDecode(response);
      decodedData = response;
      return Success(data: createTravelVendorModelFromMap(response));
    } on SocketException catch (_) {
      return AddTravelVendorFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return AddTravelVendorFailure(message: "Request Timeout.");
    } catch (e) {
      print("Add travel service error: $e");
      return AddTravelVendorFailure(message: "${decodedData?['message']}");
    }
  }
}
