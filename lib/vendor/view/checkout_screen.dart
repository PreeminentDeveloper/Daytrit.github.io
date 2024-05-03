import 'package:daytrit/home/components/bottom_nav_bar/bottom_nav.dart';
import 'package:daytrit/utils/extensions.dart';
import 'package:daytrit/utils/url_paths.dart';
import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:daytrit/vendor/widgets/custom_button.dart';
import 'package:daytrit/vendor/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:provider/provider.dart';

import '../../authentication/components/loader/loader.dart';
import '../../utils/constants.dart';
import '../../utils/size_utils.dart';
import '../model/MyTextEditingControllerList.dart';
import '../widgets/common_image_view.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: PaystackKey.pubKey);
  }

  @override
  Widget build(BuildContext context) {
    final vv = Provider.of<VendorViewModel>(context);
    final vendor = vv.vendors[vv.selectedVendor];
    vv.accName = TextEditingController();
    vv.accNumber = TextEditingController();
    vv.phone = TextEditingController();
    vv.teCtr = MyTextEditingControllerList(vendor.requiredCheckoutField ?? []);
    vv.checkoutForm = GlobalKey<FormState>(debugLabel: "superman");
    return Builder(builder: (context) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: AppColours.gray50,
              appBar: AppBar(
                  backgroundColor: AppColours.gray50,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Checkout",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColours.bluegray700A2,
                      fontSize: getFontSize(
                        32,
                      ),
                      fontFamily: 'Aeonik',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  leading: InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black45,
                    ),
                    onTap: () => Navigator.pop(context),
                  )),
              body: SingleChildScrollView(
                  child: Form(
                      key: vv.checkoutForm,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (vv.orderIsSuccess)
                              SizedBox(
                                width: size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Your application is successful!",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColours.bluegray700,
                                          fontSize: getFontSize(
                                            26,
                                          ),
                                          fontFamily: 'Aeonik',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: getMargin(
                                        left: 83,
                                        top: 28,
                                        right: 83,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: AppColours.greenA700,
                                          width: getHorizontalSize(
                                            4.00,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(47),
                                      ),
                                      child: Container(
                                        height: getSize(
                                          94.00,
                                        ),
                                        width: getSize(
                                          94.00,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              47.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: AppColours.greenA700,
                                            width: getHorizontalSize(
                                              4.00,
                                            ),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: getPadding(
                                                  left: 22,
                                                  top: 30,
                                                  right: 22,
                                                  bottom: 30,
                                                ),
                                                child: CommonImageView(
                                                  svgPath:
                                                      AppImages.imgCheckmark,
                                                  height: getVerticalSize(
                                                    33.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    48.00,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 83,
                                        top: 34,
                                        right: 83,
                                      ),
                                      child: Text(
                                        "Your booking ID is: ${vv.orderId}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColours.gray701,
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          fontFamily: 'Aeonik',
                                          fontWeight: FontWeight.w500,
                                          height: 1.27,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: getHorizontalSize(
                                        148.00,
                                      ),
                                      margin: getMargin(
                                        left: 83,
                                        top: 16,
                                        right: 83,
                                      ),
                                      child: Text(
                                        "You will recieve a booking confirmation email with details of your order(s).",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColours.gray701,
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          fontFamily: 'Aeonik',
                                          fontWeight: FontWeight.w400,
                                          height: 1.45,
                                        ),
                                      ),
                                    ),
                                    CustomButton(
                                      onTap: () {
                                        vv.resetState();
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BottomNav()));
                                      },
                                      width: 206,
                                      text: "Continue",
                                      margin: getMargin(
                                        left: 83,
                                        top: 25,
                                        right: 83,
                                      ),
                                      padding: ButtonPadding.PaddingAll12,
                                    ),
                                    if (vv.selectedVendor == 0)
                                      Padding(
                                        padding: getPadding(
                                          left: 83,
                                          top: 15,
                                          right: 83,
                                          bottom: 5,
                                        ),
                                        child: Text(
                                          "Data will be credited within 24 hours",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColours.deepOrangeA200,
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            fontFamily: 'Aeonik',
                                            fontWeight: FontWeight.w700,
                                            height: 1.25,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if (vv.orderIsFailed)
                              SizedBox(
                                width: size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: getHorizontalSize(
                                          253.00,
                                        ),
                                        margin: getMargin(
                                          left: 61,
                                          top: 114,
                                          right: 61,
                                        ),
                                        child: Text(
                                          "Your transaction failed\nto confirm",
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColours.bluegray700,
                                            fontSize: getFontSize(
                                              26,
                                            ),
                                            fontFamily: 'Aeonik',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: getHorizontalSize(
                                          94.00,
                                        ),
                                        margin: getMargin(
                                          left: 61,
                                          top: 28,
                                          right: 61,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              47.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: AppColours.redA700,
                                            width: getHorizontalSize(
                                              4.00,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    47.00,
                                                  ),
                                                ),
                                                child: CommonImageView(
                                                  svgPath: AppImages.imgX,
                                                  height: getSize(
                                                    94.00,
                                                  ),
                                                  width: getSize(
                                                    94.00,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: getHorizontalSize(
                                          209.00,
                                        ),
                                        margin: getMargin(
                                          left: 61,
                                          top: 26,
                                          right: 61,
                                        ),
                                        child: Text(
                                          "${vv.errMsg}",
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColours.gray700,
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            fontFamily: 'Aeonik',
                                            fontWeight: FontWeight.w700,
                                            height: 1.64,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(
                                          left: 61,
                                          top: 27,
                                          right: 61,
                                          bottom: 203,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            CustomButton(
                                              width: 106,
                                              text: "Close",
                                              onTap: () {
                                                vv.resetState();
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BottomNav()));
                                              },
                                              variant:
                                                  ButtonVariant.OutlineGray501,
                                              padding:
                                                  ButtonPadding.PaddingAll12,
                                              fontStyle: ButtonFontStyle
                                                  .AeonikBold14Gray501,
                                            ),
                                            CustomButton(
                                              onTap: () => vv.cancel(context),
                                              width: 106,
                                              text: "Try again",
                                              margin: getMargin(
                                                left: 24,
                                              ),
                                              padding:
                                                  ButtonPadding.PaddingAll12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (vv.loading) Center(child: const Loader()),
                            if (vv.orderIsFailed == false &&
                                vv.orderIsSuccess == false)
                              (vendor.title == "N2,000 CASH")
                                  ? Column(children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: DropdownButtonFormField<String>(
                                          items: DropData.getBanks
                                              .map((Map<String, dynamic> bank) {
                                            return DropdownMenuItem(
                                                value: bank["name"].toString(),
                                                child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                    child: Text(bank["name"]
                                                        .toString())));
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            vv.bankName = "$newValue";
                                          },
                                          value: vv.bankName,
                                          validator: (val) {
                                            if (val != null) {
                                              return null;
                                            }
                                            return "Please select bank";
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    5, 10, 5, 10),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  8.00,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                color: AppColours.gray501,
                                                width: 1,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                            hintText: "Select Bank",
                                          ),
                                        ),
                                      ),
                                      CustomTextFormField(
                                          key: Key("acc_name"),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          controller: vv.accName,
                                          validator: (String? value) {
                                            if (vv.accName?.text == "") {
                                              return "Please enter a value ";
                                            }
                                            return null;
                                          },
                                          fontStyle: TextFormFieldFontStyle
                                              .AeonikRegular18,
                                          padding:
                                              TextFormFieldPadding.PaddingAll18,
                                          hintText: 'Enter Your Account Name',
                                          margin: getMargin(
                                            left: 22,
                                            top: 20,
                                            right: 22,
                                          )),
                                      CustomTextFormField(
                                          key: Key("acc_num"),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          controller: vv.accNumber,
                                          keyboardType: TextInputType.number,
                                          validator: (String? value) {
                                            if (vv.accNumber?.text == "") {
                                              return "Please enter a value ";
                                            }
                                            return null;
                                          },
                                          fontStyle: TextFormFieldFontStyle
                                              .AeonikRegular18,
                                          padding:
                                              TextFormFieldPadding.PaddingAll18,
                                          hintText:
                                              'Enter Your Bank Account Number',
                                          margin: getMargin(
                                            left: 22,
                                            top: 20,
                                            right: 22,
                                          )),
                                      CustomTextFormField(
                                          key: Key("phone"),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          controller: vv.phone,
                                          keyboardType: TextInputType.number,
                                          validator: (String? value) {
                                            if (vv.phone?.text == "") {
                                              return "Please enter a value ";
                                            }
                                            return null;
                                          },
                                          fontStyle: TextFormFieldFontStyle
                                              .AeonikRegular18,
                                          padding:
                                              TextFormFieldPadding.PaddingAll18,
                                          hintText: 'Enter Your Phone Number',
                                          margin: getMargin(
                                            left: 22,
                                            top: 20,
                                            right: 22,
                                          )),
                                      CustomButton(
                                        onTap: () {
                                          vv.submitOrder(type: "2kcash");
                                        },
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        text: "Submit order",
                                        margin: getMargin(
                                          left: 12,
                                          top: 20,
                                          right: 12,
                                          bottom: 5,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ])
                                  : (vendor.title == "N500 AIRTIME")
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  items: DropData.networks
                                                      .map((String net) {
                                                    return DropdownMenuItem(
                                                        value: net,
                                                        child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                            child: Text(net)));
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    vv.network = "$newValue";
                                                  },
                                                  value:
                                                      DropData.networks.first,
                                                  validator: (val) {
                                                    if (val != null) {
                                                      return null;
                                                    }
                                                    return "Please select network";
                                                  },
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .fromLTRB(
                                                            5, 10, 5, 10),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        getHorizontalSize(
                                                          8.00,
                                                        ),
                                                      ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            AppColours.gray501,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.transparent,
                                                    hintText: "Select Network",
                                                  ),
                                                ),
                                              ),
                                              CustomTextFormField(
                                                  key: Key("phone"),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  controller: vv.phone,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (String? value) {
                                                    if (vv.phone?.text == "") {
                                                      return "Please enter a value ";
                                                    }
                                                    return null;
                                                  },
                                                  fontStyle:
                                                      TextFormFieldFontStyle
                                                          .AeonikRegular18,
                                                  padding: TextFormFieldPadding
                                                      .PaddingAll18,
                                                  hintText:
                                                      'Enter Your Phone Number',
                                                  margin: getMargin(
                                                    left: 22,
                                                    top: 20,
                                                    right: 22,
                                                  )),
                                              CustomButton(
                                                onTap: () {
                                                  vv.submitOrder(
                                                      type: "500airtime");
                                                },
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                text: "Submit order",
                                                margin: getMargin(
                                                  left: 12,
                                                  top: 20,
                                                  right: 12,
                                                  bottom: 5,
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                            ])
                                      : vendor.requiredCheckoutField
                                                  ?.isNotEmpty ==
                                              true
                                          ? Column(children: [
                                              SizedBox(
                                                  height:
                                                      (vendor.requiredCheckoutField
                                                                  ?.length ??
                                                              1) *
                                                          90,
                                                  child: ListView.builder(
                                                    itemBuilder: (item, index) {
                                                      return CustomTextFormField(
                                                          key: Key(
                                                              "${vendor.id}-$index"),
                                                          width: 200,
                                                          controller: vv.teCtr
                                                                  ?.controllers[
                                                              index],
                                                          validator:
                                                              (String? value) {
                                                            if (vv
                                                                        .teCtr
                                                                        ?.controllers[
                                                                            index]
                                                                        .text ==
                                                                    null ||
                                                                vv
                                                                        .teCtr
                                                                        ?.controllers[
                                                                            index]
                                                                        .text ==
                                                                    "") {
                                                              return "Please enter a value ";
                                                            }
                                                            return null;
                                                          },
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .AeonikRegular18,
                                                          padding:
                                                              TextFormFieldPadding
                                                                  .PaddingAll14,
                                                          hintText: vendor
                                                              .requiredCheckoutField?[
                                                                  index]
                                                              .replaceAll(
                                                                  "_", " ")
                                                              .capitalize(),
                                                          margin: getMargin(
                                                            left: 22,
                                                            top: 20,
                                                            right: 22,
                                                          ));
                                                    },
                                                    itemCount: vendor
                                                        .requiredCheckoutField
                                                        ?.length,
                                                  )),
                                              if (vendor.requiredCheckoutField!
                                                  .isEmpty)
                                                Center(
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        child: Text(
                                                            "This package  is currently unavailable",
                                                            style: TextStyle(
                                                              color: AppColours
                                                                  .bluegray700A2,
                                                              fontSize:
                                                                  getFontSize(
                                                                20,
                                                              ),
                                                            )))),
                                              CustomButton(
                                                onTap: () {
                                                  if (vendor
                                                          .requiredCheckoutField
                                                          ?.isNotEmpty ==
                                                      true) {
                                                    vv.submitOrder(
                                                        plugin: plugin,
                                                        context: context);
                                                  }
                                                },
                                                variant:
                                                    (vendor.requiredCheckoutField
                                                                ?.isNotEmpty ==
                                                            true)
                                                        ? null
                                                        : ButtonVariant
                                                            .FillRed100,
                                                width: 200,
                                                text: "Submit order",
                                                margin: getMargin(
                                                  left: 12,
                                                  top: 0,
                                                  right: 12,
                                                  bottom: 5,
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                            ])
                                          : SizedBox()
                          ],
                        ),
                      )))));
    });
  }
}
