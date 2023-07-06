import 'dart:io';

import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/edit_profile_service.dart';
import 'package:daytrit/home/models/dataModel/userPofile_response.dart';
import 'package:flutter/material.dart';

class EditProfileViewModel extends ChangeNotifier {
  bool _loading = false;
  UserProfileResponse? _editProfileModel;
  AuthError? _authError;
  EditProfileFailure? _editProfileFailure;

  bool get loading => _loading;
  UserProfileResponse? get editProfileModel => _editProfileModel;
  AuthError? get authError => _authError;
  EditProfileFailure? get editProfileFailure => _editProfileFailure;

  EditProfileViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setEditProfileModel(dynamic editProfileModel) =>
      _editProfileModel = editProfileModel;

  setAuthError(AuthError authError) => _authError = authError;

  setEditProfileFailureModel(EditProfileFailure editProfileFailure) =>
      _editProfileFailure = editProfileFailure;

  editProfile(data) async {
    setLoading(true);
    var response = await EditProfileService.editProfile(data);
    if (response is Success) {
      setEditProfileModel(response.data);
    }
    if (response is EditProfileFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }

    setLoading(false);
  }

  uploadImage(
    data,
    file,
  ) async {
    setLoading(true);
    var response = await EditProfileService.uploadImage(
      data,
      file,
    );
    print("Image Response DATA: $response");

    if (response is Success) {
      setEditProfileModel(response.data);
    }
    if (response is EditProfileFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }

    setLoading(false);
  }

  void submitUploadImage(String s, File file) {}
}
