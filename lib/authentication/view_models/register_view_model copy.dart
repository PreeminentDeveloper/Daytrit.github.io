import 'package:daytrit/authentication/models/data_model/register_model.dart';
import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/register_service.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _loading = false;
  RegisterModel? _registerModel;
  AuthError? _authError;
  SignUpFailure? _signUpFailure;

  bool get loading => _loading;
  RegisterModel? get registerModel => _registerModel;
  AuthError? get authError => _authError;
  SignUpFailure? get signUpFailure => _signUpFailure;

  RegisterViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setregisterModel(dynamic registerModel) => _registerModel = registerModel;

  setAuthError(AuthError authError) => _authError = authError;

  setSignUpFailureModel(SignUpFailure signUpFailure) =>
      _signUpFailure = signUpFailure;

  registerUser(data) async {
    setLoading(true);
    var response = await RegisterService.registerUser(data);
    if (response is Success) {
      setregisterModel(response.data);
    }
    if (response is SignUpFailure) {
      AuthError authError = AuthError(message: response.message);
      if (response.message == "null") {
        authError =
            AuthError(message: "Something went wrong. Please try again");
      }
      setAuthError(authError);
    }
    setLoading(false);
  }
}
