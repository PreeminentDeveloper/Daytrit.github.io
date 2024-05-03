import 'dart:io';

import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/authentication/repo/edit_profile_service.dart';
import 'package:daytrit/home/models/dataModel/purchase_coin_model.dart';
import 'package:daytrit/home/repo/purchase_coin.dart';

import 'package:flutter/material.dart';

class PurchaseTritCoinViewModel extends ChangeNotifier {
  bool _loading = false;
  PurchaseCoinModel? _purchaseCoinModel;
  AuthError? _authError;
  PurchaseCoinFailure? _purchaseCoinFailure;

  bool get loading => _loading;
  PurchaseCoinModel? get purchaseCoinModel => _purchaseCoinModel;
  AuthError? get authError => _authError;
  PurchaseCoinFailure? get purchaseCoinFailure => _purchaseCoinFailure;

  PurchaseTritCoinViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setPurchaseCoinModel(dynamic purchaseCoinModel) =>
      _purchaseCoinModel = purchaseCoinModel;

  setAuthError(AuthError authError) => _authError = authError;

  setPurchaseCoinFailureModel(PurchaseCoinFailure purchaseCoinFailure) =>
      _purchaseCoinFailure = purchaseCoinFailure;

  purchaseCoin(data) async {
    setLoading(true);
    var response = await ShopTritService.purchaseCoin(data);
    if (response is Success) {
      setPurchaseCoinModel(response.data);
    }
    if (response is PurchaseCoinFailure) {
      AuthError authError = AuthError(message: response.message);
      setAuthError(authError);
    }

    setLoading(false);
  }
}
