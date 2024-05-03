import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/all_status_model.dart';
import 'package:daytrit/home/models/dataModel/delete_account_response.dart';
import 'package:daytrit/home/models/dataModel/status_details_model.dart';
import 'package:daytrit/home/models/dataModel/status_model.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class StatusService {
  static postImageStatus(
    Map<String, dynamic> data,
    File file,
    String caption,
  ) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postImageWithText(
          StatusUrls.postStatus, data, caption, file);
      decodedData = jsonDecode(response.body);
      log(response.body);
      return Success(data: statusModelFromJson(response.body));
    } on SocketException catch (_) {
      return StatusFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return StatusFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return StatusFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);

      return StatusFetchFailure(message: "${decodedData?['message']}");
    }
  }

  static postVideoStatus(
    Map<String, dynamic> data,
    File file,
    String caption,
  ) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postVideoWithText(
          StatusUrls.postStatus, data, caption, file);
      decodedData = jsonDecode(response.body);
      log(response.body);
      return Success(data: statusModelFromJson(response.body));
    } on SocketException catch (_) {
      return StatusFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return StatusFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return StatusFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);

      return StatusFetchFailure(message: "${decodedData?['message']}");
    }
  }

  Future<ApiResponse> getAllStatus() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.getWithToken(StatusUrls.getAllStatus);
      decodedData = response;
      List<dynamic> ls = response['data'];
      log('all status $ls');
      return Success(data: ls.map((e) => AllStatusModel.fromJson(e)).toList());
    } on SocketException catch (_) {
      return StatusFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return StatusFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return StatusFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);

      return StatusFetchFailure(message: "${decodedData?['message']}");
    }
  }

  Future<ApiResponse> getUserStatus() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response =
          await networkHandler.getWithToken(StatusUrls.getUserStatus);
      decodedData = response;
      List<dynamic> ls = response['data'];
      log('user status $ls');
      return Success(
          data: ls.map((e) => StatusDetailsModel.fromJson(e)).toList());
    } on SocketException catch (_) {
      return StatusFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return StatusFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return StatusFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);
      return StatusFetchFailure(message: "${decodedData?['message']}");
    }
  }

  static deleteStatus(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    var response;

    try {
      response =
          await networkHandler.deleteWithToken(StatusUrls.deleteStatus, data);
      print("RESPONSE: $response");
      return Success(data: DeleteAccountResponse.fromJson(response));
    } on SocketException catch (_) {
      return StatusFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return StatusFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return StatusFetchFailure(message: "Invalid Format");
    } catch (e) {
      print("ERROR - $e");
      return StatusFetchFailure(message: "${response!['message']}");
    }
  }
}
