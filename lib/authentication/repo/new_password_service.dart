import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

import '../models/data_model/new_password_model.dart';

class NewPasswordService {
  static newPassword(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postWithoutToken(
          AuthenticationUrls.newPassword, data);
      decodedData = jsonDecode(response.body);
      return Success(data: newPasswordModelFromJson(response.body));
    } on SocketException catch (_) {
      return NewPasswordFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return NewPasswordFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return NewPasswordFailure(message: "Invalid Format");
    } catch (e) {
      return NewPasswordFailure(message: "${decodedData!['message']}");
    }
  }
}
