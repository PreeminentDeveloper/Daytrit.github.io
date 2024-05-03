import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/userPofile_response.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class EditProfileService {
  static editProfile(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response =
          await networkHandler.postWithToken(AuthenticationUrls.profile, data);
      decodedData = jsonDecode(response.body);
      log(response.body);
      return Success(data: userProfileResponseFromMap(response.body));
    } on SocketException catch (_) {
      return EditProfileFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return EditProfileFailure(message: "Request Timeout.");
    } catch (e) {
      return EditProfileFailure(message: "${decodedData?['message']}");
    }
  }

  static uploadImage(
    Map<String, dynamic> data,
    File file,
  ) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postImage(
        AuthenticationUrls.uploadImage,
        data,
        file,
      );

      return Success(data: UserProfileResponse.fromMap(response));
    } on SocketException catch (_) {
      return EditProfileFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return EditProfileFailure(message: "Request Timeout.");
    } catch (e) {
      return EditProfileFailure(message: "An Error Occurred!");
    }
  }
}
