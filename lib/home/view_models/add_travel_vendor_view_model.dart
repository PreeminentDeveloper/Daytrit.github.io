import 'package:daytrit/authentication/models/data_model/register_model.dart';
import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/register_service.dart';
import 'package:daytrit/home/models/dataModel/create_travel_vendor_model.dart';
import 'package:daytrit/home/repo/add_travel_vendor_service.dart';
import 'package:flutter/material.dart';

class AddTravelVendorViewModel extends ChangeNotifier {
  bool _loading = false;
  CreateTravelVendorModel? _createTravelVendorModel;
  AuthError? _authError;
  AddTravelVendorFailure? _addTravelVendorFailure;

  bool get loading => _loading;
  CreateTravelVendorModel? get createTravelVendorModel =>
      _createTravelVendorModel;
  AuthError? get authError => _authError;
  AddTravelVendorFailure? get addTravelVendorFailure => _addTravelVendorFailure;

  AddTravelVendorViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setAddTravelVendorModel(dynamic createTravelVendorModel) =>
      _createTravelVendorModel = createTravelVendorModel;

  setAuthError(AuthError authError) => _authError = authError;

  addTravelVendor(
      title,
      category,
      state,
      paymentMethod,
      cashPrice,
      requiredCheckoutField,
      rating,
      type,
      country,
      address,
      description,
      features,
      photo) async {
    setLoading(true);
    var response = await AddTravelVendorService.addTravelVendor(
        title,
        category,
        state,
        paymentMethod,
        cashPrice,
        requiredCheckoutField,
        rating,
        type,
        country,
        address,
        description,
        features,
        photo);
    print("Response VM: $response");
    if (response is Success) {
      print("resp: ${response.data}");
      setAddTravelVendorModel(response.data);
    }
    if (response is SignUpFailure) {
      print("Error-msg: ${response.message}");
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }
    setLoading(false);
  }
}
