import 'package:daytrit/authentication/models/data_model/login_model.dart';
import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/login_with_google_service.dart';
import 'package:flutter/material.dart';

class LoginWithGoogleViewModel extends ChangeNotifier {
  bool _loading = false;
  LoginModel? _loginModel;
  AuthError? _authError;
  LoginFailure? _loginFailure;

  bool get loading => _loading;
  LoginModel? get loginModel => _loginModel;
  AuthError? get authError => _authError;
  LoginFailure? get loginFailure => _loginFailure;

  LoginWithGoogleViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setLoginModel(dynamic loginModel) => _loginModel = loginModel;

  setAuthError(AuthError authError) => _authError = authError;

  loginUser() async {
    setLoading(true);
    var response = await LoginWithGoogleService.login();
    print(response);
    if (response is Success) {
      setLoginModel(response.data);
    }
    if (response is LoginFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }
    setLoading(false);
  }
}
