// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;
import 'package:daytrit/utils/url_paths.dart';
import 'package:daytrit/utils/paystack_interop.dart' as paystack;

class PaystackPopup {
  static Future<void> openPaystackPopup({
    required String email,
    required String amount,
    required String ref,
    required void Function() onClosed,
    required void Function() onSuccess,
  }) async {
    js.context.callMethod(
      paystack.paystackPopUp(
        PaystackKey.pubKey,
        email,
        amount,
        ref,
        js.allowInterop(
          onClosed,
        ),
        js.allowInterop(
          onSuccess,
        ),
      ),
      [],
    );
  }

  static Future<void> check() async {
    print("hello");
  }
}
