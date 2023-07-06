import 'dart:async';
import 'dart:io';
import 'package:daytrit/home/models/dataModel/explore_model.dart';
import 'package:daytrit/home/repo/api_status.dart';

import '../../utils/network_handler.dart';
import '../../utils/url_paths.dart';

class ExploreService {
  static fetchExploreData() async {
    NetworkHandler networkHandler = NetworkHandler();
    var response;
    try {
      response = await networkHandler.getWithToken(ExploreUrls.explore);
      print("Check Response: $response");
      return Success(data: ExploreModel.fromJson(response));
    } on SocketException catch (_) {
      return ExploreFailure(message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return ExploreFailure(message: "Request Timeout.");
    } catch (e) {
      return ExploreFailure(message: "${response!['message']}");
    }
  }
}
