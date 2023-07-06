import 'package:daytrit/authentication/models/data_model/forgot_password_model.dart';
import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/forgot_password_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  bool _loading = false;
  ForgotPasswordModel? _forgotPasswordModel;
  AuthError? _authError;

  bool get loading => _loading;
  ForgotPasswordModel? get forgotPasswordModel => _forgotPasswordModel;
  AuthError? get authError => _authError;

  ForgotPasswordViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setForgotPasswordModel(dynamic forgotPasswordModel) =>
      _forgotPasswordModel = forgotPasswordModel;

  setAuthError(AuthError authError) => _authError = authError;

  sendEmail({data}) async {
    setLoading(true);
    var response = await ForgotPasswordService.forgotPassword(data);
    if (response is Success) {
      setForgotPasswordModel(response.data);
    }
    if (response is ForgotPasswordFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }
    setLoading(false);
  }
}
