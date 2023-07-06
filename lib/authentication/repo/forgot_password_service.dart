import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/models/data_model/forgot_password_model.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class ForgotPasswordService {
  static forgotPassword(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postWithoutToken(
          AuthenticationUrls.forgotPassword, data);
      decodedData = jsonDecode(response.body);
      return Success(data: forgotPasswordModelFromJson(response.body));
    } on SocketException catch (_) {
      return ForgotPasswordFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return ForgotPasswordFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return ForgotPasswordFailure(message: "Invalid Format");
    } catch (e) {
      return ForgotPasswordFailure(message: "${decodedData!['message']}");
    }
  }
}
