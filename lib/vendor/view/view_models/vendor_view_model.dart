import 'dart:math';

import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/vendor/model/vendor_model.dart';
import 'package:daytrit/vendor/repo/vendor_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../authentication/components/flushbar/custom_flush_bar.dart';
import '../../model/MyTextEditingControllerList.dart';

class VendorViewModel extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;
  final VendorService _vendorService = VendorService();
  int selectedVendor = 0;
  List<VendorModel> vendors = <VendorModel>[];
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  MyTextEditingControllerList? teCtr;
  TextEditingController? accName;
  TextEditingController? accNumber;
  TextEditingController? phone;
  String bankName = 'Select Bank';
  String paymentMethod = 'trit';
  String network = 'Select Network';
  final CustomFlushBar customFlushBar = CustomFlushBar();
  GlobalKey<FormState>? formKey;
  GlobalKey<FormState>? checkoutForm;
  String? errMsg = '';
  bool orderIsSuccess = false;
  bool orderIsFailed = false;
  bool isPaymentWithTritCoins = false;
  bool paystackStatus = false;
  String? orderId;

  String paystackMessage = '';
  String? paystackReference = '';
  String? price;

  String? customerEmail;
  dynamic formDataResponse;

  int cashPrice = 0;

  getEmail({context}) {
    final profileModel = Provider.of<ProfileViewModel>(context!, listen: false);
    customerEmail = profileModel.userData!.email;
  }

  Future<Map<String, dynamic>> makepayment(
      {BuildContext? context,
      PaystackPlugin? plugin,
      bool? isToPurchaceCoin,
      int? amount}) async {
    if (isToPurchaceCoin == true) {
      print("--- Coin Purchase ---");
      getEmail(context: context);
      price = amount.toString();
      cashPrice = int.parse(price!) * 100;
    } else {
      isToPurchaceCoin = false;
      print("--- Event application ---");
      formDataResponse = formData();
      getEmail(context: context);
      cashPrice = int.parse(price!) * 100;
      print("FormData Response: $formDataResponse and $customerEmail");
    }

    print(
        "isToPurchaceCoin: $isToPurchaceCoin, isPaymentWithTritCoins: $isPaymentWithTritCoins");

    if (isToPurchaceCoin == true || isPaymentWithTritCoins == false) {
      Charge charge = Charge()
        ..amount = cashPrice
        ..reference = 'Ref_${DateTime.now()}'
        ..email = customerEmail
        ..currency = "NGN";
      CheckoutResponse response = await plugin!.checkout(
        context!,
        method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
        charge: charge,
      );
      paystackStatus = response.status;
      paystackReference = response.reference;
      paystackMessage = response.message;
    } else {
      return {"isMade": true};
    }
    print("paystackStatus: $paystackStatus");
    isToPurchaceCoin = false;
    isPaymentWithTritCoins = false;

    if (paystackStatus == true) {
      return {
        "isMade": true,
        "message": "Payment was successful. Ref: $paystackReference",
        "paymentReference": paystackReference
      };
    } else {
      return {"isMade": false, "message": paystackMessage};
    }
  }

  final Random random = Random();

  void tryAgain() {
    orderIsFailed = false;
    orderIsSuccess = false;
    notifyListeners();
  }

  void cancel(BuildContext context) {
    Navigator.pop(context);
    orderIsFailed = false;
    orderIsSuccess = false;
    notifyListeners();
  }

  void onRefresh() async {
    // monitor network fetch
    setLoading(true);
    await getAllVendors();
    refreshController.refreshCompleted();
    setLoading(false);
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<bool> getAllVendors({String? entry}) async {
    setLoading(true);
    try {
      vendors = [];
      final ApiResponse response = await _vendorService.getVendors(entry);
      if (response is Success) {
        vendors = response.data as List<VendorModel>;
      } else {
        return false;
      }
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }

  Map<String, dynamic> formData() {
    Map<String, dynamic> inputData = teCtr?.getData() ?? {};
    isPaymentWithTritCoins = vendors[selectedVendor].coinPrice == null ||
            vendors[selectedVendor].coinPrice == '0'
        ? false
        : true;
    print("Coint Price: ${vendors[selectedVendor].coinPrice}");
    print("Check: $isPaymentWithTritCoins");
    price =
        vendors[selectedVendor].cashPrice ?? vendors[selectedVendor].coinPrice;
    print("PRICE: $price");
    inputData.addAll({
      'product_id': "${vendors[selectedVendor].id}",
      "amount":
          vendors[selectedVendor].cashPrice ?? vendors[selectedVendor].coinPrice
    });
    print("Input Data: $inputData");
    // getEmail();
    return inputData;
  }

  Future<void> submitOrder(
      {String type = "default",
      BuildContext? context,
      PaystackPlugin? plugin}) async {
    if (checkoutForm?.currentState?.validate() == false) {
      return;
    }
    setLoading(true);
    ApiResponse? response;
    print(type);
    if (type == "default") {
      dynamic result = await makepayment(context: context, plugin: plugin);
      print("FORM DATA BEFORE SUBMITTING: $formDataResponse");
      if (result['isMade']) {
        print("Is Made pay: ${result['isMade']}");
        response = await _vendorService.order(formDataResponse);
        print("FORM DATA AFTER SUBMITTING: $formDataResponse");
      } else {
        Navigator.of(context!).pop();
        customFlushBar.showErrorFlushBar(
            title: 'Error occurred', body: result['message'], context: context);
      }
    } else if (type == "2kcash") {
      response = await _vendorService.order({
        "account_name": accName?.text,
        "account_number": accNumber?.text,
        "bank_name": bankName,
        "phone": phone?.text,
        'product_id': "${vendors[selectedVendor].id}",
        "amount": vendors[selectedVendor].cashPrice ??
            vendors[selectedVendor].coinPrice
      });
    } else {
      response = await _vendorService.order({
        "choose_network": network,
        "phone": phone?.text,
        'product_id': "${vendors[selectedVendor].id}",
        "amount": vendors[selectedVendor].cashPrice ??
            vendors[selectedVendor].coinPrice
      });
    }
    if (response is VendorSuccess) {
      orderIsSuccess = true;
      orderId = response.data != null && response.data!['booking_id'] != null
          ? "${response.data!['booking_id']}"
          : "${random.nextInt(99999)}";
    } else {
      orderIsFailed = true;
      errMsg = response!.message;
    }
    setLoading(false);
  }

  Future<void> resetState() async {
    orderIsSuccess = false;
    orderIsFailed = false;
    _loading = false;
    accName?.dispose();
    accNumber?.dispose();
    phone?.dispose();
    bankName = '';
    network = '';
    errMsg = '';
    teCtr?.dispose();
  }
}
