import 'dart:io';

import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/register_service.dart';
import 'package:daytrit/authentication/models/data_model/register_agent_model.dart';
import 'package:flutter/material.dart';

class RegisterAgentViewModel extends ChangeNotifier {
  bool _loading = false;
  RegisterAgentModel? _registerAgentModel;
  AuthError? _authError;
  SignUpFailure? _signUpFailure;

  bool get loading => _loading;
  RegisterAgentModel? get registerAgentModel => _registerAgentModel;
  AuthError? get authError => _authError;
  SignUpFailure? get signUpFailure => _signUpFailure;

  RegisterAgentViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setregisterModel(dynamic registerAgentModel) =>
      _registerAgentModel = registerAgentModel;

  setAuthError(AuthError authError) => _authError = authError;

  setSignUpFailureModel(SignUpFailure signUpFailure) =>
      _signUpFailure = signUpFailure;

  registerAgent(
      {required String firstName,
      required String lastName,
      dynamic phoneNumber,
      required String email,
      required String companyName,
      required String companyAddress,
      required String password,
      required String idCardType,
      dynamic idNumber,
      required File? idFile,
      required File? companyCertificateFile}) async {
    setLoading(true);
    var response = await RegisterService.registerAgent(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        companyName: companyName,
        companyAddress: companyAddress,
        password: password,
        idCardType: idCardType,
        idNumber: idNumber,
        idFile: idFile,
        companyCertificateFile: companyCertificateFile);
    if (response is Success) {
      setregisterModel(response.data);
    }
    if (response is SignUpFailure) {
      print("Response-agent-message --->> ${response.message}");
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
