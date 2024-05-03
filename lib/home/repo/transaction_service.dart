import 'dart:async';
import 'dart:io';

import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/transaction_model.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class TransactionService {
  Future<ApiResponse> getTransaction() async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response =
          await networkHandler.getWithToken(TransactionUrls.transaction);
      decodedData = response;
      List<dynamic> ls = response['data'];
      print('transac $ls');
      return Success(
          data: ls.map((e) => TransactionModel.fromJson(e)).toList());
    } on SocketException catch (_) {
      return VendorFetchFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return TransactionFetchFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return TransactionFetchFailure(message: "Invalid Format");
    } catch (e) {
      print(e);

      return TransactionFetchFailure(message: "${decodedData?['message']}");
    }
  }
}
