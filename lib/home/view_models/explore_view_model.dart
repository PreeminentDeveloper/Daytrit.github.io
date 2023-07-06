import 'package:daytrit/home/models/dataModel/explore_model.dart';
import 'package:daytrit/home/models/error_model/explore_data_error.dart';
import 'package:daytrit/home/repo/explore_service.dart';
import 'package:flutter/material.dart';
import '../repo/api_status.dart';

class ExploreViewModel extends ChangeNotifier {
  bool _loading = false;
  ExploreModel? _exploreData;
  ExploreDataError? _exploreDataError;

  bool get loading => _loading;

  ExploreModel? get exploreData => _exploreData;
  ExploreDataError? get exploreDataError => _exploreDataError;

  ExploreViewModel();

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setExploreModel(dynamic exploreData) => _exploreData = exploreData;

  setExploreError(ExploreDataError exploreDataError) =>
      _exploreDataError = exploreDataError;

  getExploreData() async {
    setLoading(true);
    final response = await ExploreService.fetchExploreData();
    if (response is Success) {
      setExploreModel(response.data);
    }
    if (response is ExploreFailure) {
      ExploreDataError exploreDataError =
          ExploreDataError(message: response.message);
      setExploreError(exploreDataError);
    }
    setLoading(false);
  }
}
