import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/models/data_model/login_model.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class LoginService {
  static loginUser(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;
    try {
      var response =
          await networkHandler.postWithoutToken(AuthenticationUrls.login, data);
      decodedData = jsonDecode(response.body);
      return Success(data: loginModelFromJson(response.body));
    } on SocketException catch (_) {
      return LoginFailure(message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return LoginFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return LoginFailure(message: "Invalid Format");
    } catch (e) {
      return LoginFailure(message: "${decodedData!['message']}");
    }
  }
}
