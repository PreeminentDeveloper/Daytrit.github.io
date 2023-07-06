import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/home/repo/api_status.dart';
import 'package:daytrit/home/view_models/earn_coin_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EarnCoinRewardViewModel extends ChangeNotifier {
  final CustomFlushBar customFlushBar = CustomFlushBar();

  void rewardAd(BuildContext context) async {
    var data = {
      "coin": 5,
    };
    final earnCoinViewModel =
        Provider.of<EarnCoinViewModel>(context, listen: false);
    await earnCoinViewModel.earnCoin(data);

    Object? errorMessage = earnCoinViewModel.earnCoinFailure?.message;
    if (errorMessage != null) {
      print("Error earning reward");
    } else {
      String? successMessage = earnCoinViewModel.earnCoinResponse?.message;
      print("SUCCESS: $successMessage");
      openCustomDialog2(
        context: context,
        content:
            "Congratulations!!\n\nYou have just added 5 Trit coins to your wallet!",
      );
    }
    clearAuthErrorMessage(earnCoinViewModel);
  }

  clearAuthErrorMessage(earnCoinViewModel) {
    EarnCoinFailure earnCoinFailure = EarnCoinFailure(message: null);
    earnCoinViewModel.setEarnCoinFailure(earnCoinFailure);
    earnCoinViewModel.earnCoinResponse;
  }
}
