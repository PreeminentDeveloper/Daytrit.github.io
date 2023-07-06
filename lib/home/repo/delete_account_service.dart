import 'dart:async';
import 'dart:io';

import 'package:daytrit/home/models/dataModel/delete_account_response.dart';
import 'package:daytrit/home/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class DeleteAccountService {
  static deleteAccount() async {
    NetworkHandler networkHandler = NetworkHandler();
    var response;

    try {
      response =
          await networkHandler.getWithToken(DeleteAccountUrl.deleteAccount);
      print("RESPONSE: $response");
      return Success(data: DeleteAccountResponse.fromJson(response));
    } on SocketException catch (_) {
      return DeleteAccountFailure(
          message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return DeleteAccountFailure(message: "Request Timeout.");
    } on FormatException catch (_) {
      return DeleteAccountFailure(message: "Invalid Format");
    } catch (e) {
      print("ERROR - $e");
      return DeleteAccountFailure(message: "${response!['message']}");
    }
  }
}
