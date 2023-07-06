import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:flutter/material.dart';

import '../models/data_model/new_password_model.dart';
import '../repo/new_password_service.dart';

class NewPasswordViewModel extends ChangeNotifier {
  bool _loading = false;
  NewPasswordModel? _newPasswordModel;
  AuthError? _authError;

  bool get loading => _loading;
  NewPasswordModel? get newPasswordModel => _newPasswordModel;
  AuthError? get authError => _authError;

  NewPasswordViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setNewPasswordModel(dynamic newPasswordModel) =>
      _newPasswordModel = newPasswordModel;

  setAuthError(AuthError authError) => _authError = authError;

  sendNewPassword({data}) async {
    setLoading(true);
    var response = await NewPasswordService.newPassword(data);
    if (response is Success) {
      print("Success: $response");
      setNewPasswordModel(response.data);
    }
    if (response is NewPasswordFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }
    setLoading(false);
  }
}
