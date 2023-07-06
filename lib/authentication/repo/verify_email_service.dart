import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/models/data_model/validate_email_model.dart';
import 'package:daytrit/authentication/models/data_model/verify_email_model.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class VerifyEmailService {
  static verifyEmail(Map<String, dynamic> data,
      {required isPasswordReset}) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      dynamic response;
      if (isPasswordReset) {
        response = await networkHandler.postWithoutToken(
            AuthenticationUrls.validateEmail, data);
        decodedData = jsonDecode(response.body);
        return Success(data: validateEmailModelFromJson(response.body));
      } else {
        response = await networkHandler.postWithoutToken(
            AuthenticationUrls.verifyEmail, data);
        decodedData = jsonDecode(response.body);
        return Success(data: verifyEmailModelFromJson(response.body));
      }
    } on SocketException catch (_) {
      return VerifyEmailFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return VerifyEmailFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return VerifyEmailFailure(message: "Invalid Format");
    } catch (e) {
      return VerifyEmailFailure(message: "${decodedData!['message']}");
    }
  }
}
