import 'package:daytrit/authentication/models/data_model/verify_email_model.dart';
import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/verify_email_service.dart';
import 'package:flutter/material.dart';

import '../models/data_model/validate_email_model.dart';

class VerifyEmailViewModel extends ChangeNotifier {
  bool _loading = false;
  VerifyEmailModel? _verifyEmailModel;
  ValidateEmailModel? _validateEmailModel;
  AuthError? _authError;
  VerifyEmailFailure? _verifyEmailFailure;

  bool get loading => _loading;
  VerifyEmailModel? get verifyEmailModel => _verifyEmailModel;
  ValidateEmailModel? get validateEmailModel => _validateEmailModel;
  AuthError? get authError => _authError;
  VerifyEmailFailure? get verifyEmailFailure => _verifyEmailFailure;

  VerifyEmailViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setVerifyEmailModel(dynamic verifyEmailData) =>
      _verifyEmailModel = verifyEmailData;

  setValidateEmailModel(dynamic validateEmailData) =>
      _validateEmailModel = validateEmailData;

  setAuthError(AuthError authError) => _authError = authError;

  verifyEmail(data, {required isPasswordReset}) async {
    setLoading(true);
    dynamic response;
    if (isPasswordReset) {
      response =
          await VerifyEmailService.verifyEmail(data, isPasswordReset: true);
    } else {
      response =
          await VerifyEmailService.verifyEmail(data, isPasswordReset: false);
    }
    if (response is Success) {
      if (isPasswordReset) {
        setValidateEmailModel(response.data);
      } else {
        setVerifyEmailModel(response.data);
      }
    }
    if (response is VerifyEmailFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }
    setLoading(false);
  }
}
