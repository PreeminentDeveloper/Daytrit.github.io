import 'package:daytrit/home/repo/earn_coin_service.dart';
import 'package:flutter/material.dart';
import '../models/dataModel/earn_coin_response.dart';
import '../repo/api_status.dart';

class EarnCoinViewModel extends ChangeNotifier {
  EarnCoinService service = EarnCoinService();

  bool _loading = false;
  EarnCoinResponse? _earnCoinResponse;
  EarnCoinFailure? _earnCoinFailure;

  bool get loading => _loading;
  EarnCoinResponse? get earnCoinResponse => _earnCoinResponse;
  EarnCoinFailure? get earnCoinFailure => _earnCoinFailure;

  EarnCoinViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setEarnCoinResponse(dynamic earnCoinResponse) =>
      _earnCoinResponse = earnCoinResponse;
  setEarnCoinFailure(EarnCoinFailure earnCoinFailure) =>
      _earnCoinFailure = earnCoinFailure;

  earnCoin(data) async {
    setLoading(true);
    var response = await EarnCoinService.coinReward(data);
    if (response is Success) {
      setEarnCoinResponse(response.data);
    }
    if (response is EarnCoinFailure) {
      EarnCoinFailure authError = EarnCoinFailure(message: response.message);
      setEarnCoinFailure(authError);
    }
    setLoading(false);
  }
}
