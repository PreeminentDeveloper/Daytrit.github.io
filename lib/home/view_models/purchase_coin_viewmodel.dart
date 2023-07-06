import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/home/view_models/purchase_trit_coin_viewmodel.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:provider/provider.dart';

class PurchaseCoinViewModel extends ChangeNotifier {
  final CustomFlushBar customFlushBar = CustomFlushBar();

  void purchaseTritCoin(BuildContext context,
      {PaystackPlugin? plugin, int? amount, int? qty}) async {
    final purchaseTritCoinViewModel =
        Provider.of<PurchaseTritCoinViewModel>(context, listen: false);
    final vendorViewModel =
        Provider.of<VendorViewModel>(context, listen: false);

    dynamic result = await vendorViewModel.makepayment(
        context: context,
        plugin: plugin,
        isToPurchaceCoin: true,
        amount: amount);
    if (result['isMade']) {
      var data = {
        "amount": amount,
        "coin": qty,
        "pay_reference": result['paymentReference'],
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
    } else {
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: result['message'], context: context);
    }
  }
}
