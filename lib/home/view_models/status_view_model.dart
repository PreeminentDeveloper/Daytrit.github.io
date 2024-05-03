import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/all_status_model.dart';
import 'package:daytrit/home/models/dataModel/status_details_model.dart';
import 'package:daytrit/home/models/dataModel/status_model.dart';
import 'package:daytrit/home/repo/status_service.dart';
import 'package:flutter/material.dart';

class StatusViewModel extends ChangeNotifier {
  StatusService service = StatusService();

  bool _loading = false;
  List<StatusDetailsModel> status = <StatusDetailsModel>[];

  List<AllStatusModel> allStatus = <AllStatusModel>[];
  //StatusModel? stat;

  bool get loading => _loading;

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  StatusModel? _statusModel;
  AuthError? _authError;
  StatusFetchFailure? _statusFailure;

  StatusModel? get statusModel => _statusModel;
  AuthError? get authError => _authError;
  StatusFetchFailure? get statusFailure => _statusFailure;

  StatusViewModel();

  setStatusModel(dynamic statusModel) => _statusModel = statusModel;

  setAuthError(AuthError authError) => _authError = authError;

  setStatusFailureModel(StatusFetchFailure statusFailure) =>
      _statusFailure = statusFailure;

  postImage(
    data,
    image,
    caption,
  ) async {
    setLoading(true);
    var response = await StatusService.postImageStatus(
      data,
      image,
      caption,
    );
    if (response is Success) {
      setStatusModel(response.data);
    }
    if (response is StatusFetchFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }

    setLoading(false);
  }

  postVideo(data, image, caption) async {
    setLoading(true);
    var response = await StatusService.postVideoStatus(
      data,
      image,
      caption,
    );
    if (response is Success) {
      setStatusModel(response.data);
    }
    if (response is StatusFetchFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }

    setLoading(false);
  }

  Future<bool> getAllStatus() async {
    setLoading(true);
    try {
      final ApiResponse response = await StatusService().getAllStatus();
      if (response is Success) {
        allStatus = response.data as List<AllStatusModel>;
      } else {
        return false;
      }
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      print("HELLO");
      return false;
    }
  }

  Future<bool> getUserStatus() async {
    setLoading(true);
    try {
      final ApiResponse response = await StatusService().getUserStatus();
      if (response is Success) {
        status = response.data as List<StatusDetailsModel>;
      } else {
        return false;
      }
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      print("HELLO");
      return false;
    }
  }
}

//