


import 'package:daytrit/home/models/error_model/fetch_data_error.dart';
import 'package:daytrit/home/repo/home_service.dart';
import 'package:flutter/material.dart';

import '../models/dataModel/home_data_response.dart';
import '../repo/api_status.dart';

class HomeViewModel extends ChangeNotifier{
  bool _loading = false;
  //late List <HomeData> _homeData;

  FetchDataError? _fetchDataError;

  FetchHomeDataResponse? _fetchHomeDataResponse;
  HomeScreenDataFailure? _homeScreenDataFailure;

  bool get loading => _loading;
  FetchDataError? get fetchDataError => _fetchDataError;
  List <HomeData> get homeData =>fetchHomeDataResponse?.data?.data ?? [];
  FetchHomeDataResponse? get fetchHomeDataResponse => _fetchHomeDataResponse;
  HomeScreenDataFailure? get userProfileFailure => _homeScreenDataFailure;

  HomeViewModel();

  HomeService service = HomeService();

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setFetchHomeDataResponse(dynamic fetchHomeDataResponse){
    return  _fetchHomeDataResponse = fetchHomeDataResponse;
  }
  setFetchDataError(FetchDataError fetchDataError) => _fetchDataError = fetchDataError;
  //setHomeScreenDataFailure(FetchDataError fetchDataError) => _homeScreenDataFailure = fetchDataError;

  Future <List<HomeData>> getHomeData() async{
    //setLoading(true);
    var response = await HomeService.fetchHomeScreenData();
    if(response is Success){
      setFetchHomeDataResponse(response.data);
    }
    if(response is HomeScreenDataFailure){
      FetchDataError fetchDataError = FetchDataError(message: response.message);
      setFetchDataError(fetchDataError);
    }
    setLoading(false);
    return homeData;
  }

}

//   Future<List<HomeData>> getHomeScreenData() async{
//     try{
//       FetchHomeDataResponse res = await HomeService.fetchHomeScreenData();
//       List<HomeData> data = res.data;
//       _homeData = data.reversed.toList();
//       return _homeData;
//     } on SocketException catch (_) {
//         return HomeScreenDataFailure(
//         message: "Kindly, check your internet connection.");
//         }
// }