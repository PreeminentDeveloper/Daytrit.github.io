import 'dart:async';
import 'dart:io';


import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/notification_model.dart';

import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';


class NotificationService {
  Future<ApiResponse> getNotification() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.getWithToken(NotificationUrls.notification);
      decodedData = response;
      List<dynamic> ls = response['data']['data'];
      print('notify $ls');
      return Success(
          data: ls.map((e) => NotificationModel.fromJson(e)).toList());
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
}
