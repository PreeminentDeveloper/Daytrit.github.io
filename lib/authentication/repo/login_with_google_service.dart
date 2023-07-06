import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/models/data_model/login_model.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogleService {
  static final _googleSignIn = GoogleSignIn();

  Future logout() => _googleSignIn.disconnect();

  static Future<Object?> login() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;
    try {
      var googleResponse = await _googleSignIn.signIn();
      print("GOOGLE RESPONSE: $googleResponse");

      if (googleResponse == null) {
        return googleResponse;
      } else {
        var userGoogleEmail = googleResponse.email;
        var data = {"email": userGoogleEmail, "status": true};
        print("PAYLOAD: $data");
        var response = await networkHandler.postWithoutToken(
            AuthenticationUrls.loginWithSocial, data);
        decodedData = jsonDecode(response.body);
        return Success(data: loginModelFromJson(response.body));
      }
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
