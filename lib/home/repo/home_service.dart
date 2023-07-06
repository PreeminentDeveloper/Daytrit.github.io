
import 'dart:async';
import 'dart:io';
import 'package:daytrit/home/repo/api_status.dart';

import '../../utils/network_handler.dart';
import '../../utils/url_paths.dart';
import '../models/dataModel/home_data_response.dart';

class HomeService{

  static fetchHomeScreenData() async{
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;
    try{
      var response = await networkHandler.getWithToken(AuthenticationUrls.fetchHomeData);
      //decodedData = jsonDecode(response);
      //print('reached ${decodedData}');
      return Success(data: fetchHomeDataResponseFromMap(response));
    } on SocketException catch (_) {
            return HomeScreenDataFailure(message: "Kindly, check your internet connection.");
       } on TimeoutException catch (_) {
           return HomeScreenDataFailure(message: "Request Timeout.");
         } catch (e) {
           //print("SSS: $e");
           return HomeScreenDataFailure(message: "${decodedData!['message']}");
         }
  }

}