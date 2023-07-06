import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/earn_coin_response.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class SearchExploreService {
  static coinReward(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response =
          await networkHandler.postWithToken(ExploreUrls.explore, data);
      decodedData = jsonDecode(response.body);
      return Success(data: earnCoinResponseFromMap(response.body));
    } on SocketException catch (_) {
      return EarnCoinFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return EarnCoinFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return EarnCoinFailure(message: "Invalid Format");
    } catch (e) {
      return EarnCoinFailure(message: "${decodedData!['message']}");
    }
  }
}
