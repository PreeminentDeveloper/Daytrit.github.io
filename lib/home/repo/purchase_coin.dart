import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/purchase_coin_model.dart';

import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class ShopTritService {
  static purchaseCoin(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response =
          await networkHandler.postWithToken(CoinUrls.purchaseCoin, data);
      decodedData = jsonDecode(response.body);
      log(response.body);
      return Success(data: purchaseCoinModelToJson(response.body));
    } on SocketException catch (_) {
      return PurchaseCoinFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return PurchaseCoinFailure(message: "Request Timeout.");
    } catch (e) {
      return PurchaseCoinFailure(message: "${decodedData?['message']}");
    }
  }
}
