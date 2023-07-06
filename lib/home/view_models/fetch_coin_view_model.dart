import 'package:daytrit/home/repo/fetch_coin_service.dart';
import 'package:flutter/material.dart';

class FetchCoinViewModel extends ChangeNotifier {
  FetchCoinService service = FetchCoinService();

  bool _loading = false;
  int? _coinData;

  bool get loading => _loading;

  int? get coinData => _coinData;

  FetchCoinViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCoinData(int coinData) => _coinData = coinData;

  getCoin() async {
    setLoading(true);
    var result = await FetchCoinService.getUserCoin();
    setCoinData(result);
    setLoading(false);
  }
}
