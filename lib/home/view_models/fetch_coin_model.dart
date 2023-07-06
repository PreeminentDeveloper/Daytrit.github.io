import 'package:daytrit/home/view_models/fetch_coin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FetchCoinModel {
  void fetchUserDetails(BuildContext context) async {
    final fetchCoinViewModel =
        Provider.of<FetchCoinViewModel>(context, listen: false);
    await fetchCoinViewModel.getCoin();
  }
}
