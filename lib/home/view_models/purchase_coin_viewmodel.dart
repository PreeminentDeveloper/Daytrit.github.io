import 'dart:math';

import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/home/repo/paystack_integration.dart';
import 'package:daytrit/home/view_models/purchase_trit_coin_viewmodel.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseCoinViewModel extends ChangeNotifier {
  final CustomFlushBar customFlushBar = CustomFlushBar();

  void purchaseTritCoin(BuildContext context, {int? amount, int? qty}) async {
    final purchaseTritCoinViewModel =
        Provider.of<PurchaseTritCoinViewModel>(context, listen: false);
    final profileModel = Provider.of<ProfileViewModel>(context, listen: false);
    final customerEmail = profileModel.userData!.email;
    final ref = generateRef();
    print("Ref: $ref");

    await PaystackPopup.openPaystackPopup(
      email: customerEmail,
      amount: (amount! * 100).toString(),
      ref: ref,
      onClosed: () {
        debugPrint("Couldn't finish payment");
        customFlushBar.showErrorFlushBar(
            title: 'Error occurred',
            body: "Payment canceled",
            context: context);
      },
      onSuccess: () async {
        debugPrint('successful payment');
        var data = {
          "amount": amount,
          "coin": qty,
          "pay_reference": ref,
        };
        print("DATA: $data");
        await purchaseTritCoinViewModel.purchaseCoin(data);

        Object? errorMessage =
            purchaseTritCoinViewModel.purchaseCoinFailure?.message;
        if (errorMessage != null) {
          print("Error purchasing coin");
        } else {
          String? successMessage =
              purchaseTritCoinViewModel.purchaseCoinModel?.message;
          print("SUCCESS: $successMessage");
          openCustomDialog2(
            context: context,
            content: "Coin purchased successfully",
          );
        }
      },
    );
  }

  String generateRef() {
    final randomCode = Random().nextInt(3234234);
    return 'ref-$randomCode';
  }
}
