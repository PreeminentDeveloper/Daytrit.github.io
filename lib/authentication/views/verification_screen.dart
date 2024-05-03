import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/authentication/view_models/verify_email_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  String currentText = "";
  bool hasError = false;
  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationViewModel>(context);
    final verifyEmailViewModel = Provider.of<VerifyEmailViewModel>(context);
    return Scaffold(
      backgroundColor: AppColours.white,
      body: ModalProgressHUD(
        inAsyncCall: verifyEmailViewModel.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Container(
            color: AppColours.monochromeWhite,
            padding: const EdgeInsets.only(
              top: 60,
              left: 12,
              right: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText(
                    context: context,
                    title: "Verification",
                    fontSize: 32,
                    color: AppColours.darkLemon,
                    weight: FontWeight.w700),
                addVerticalSpace(132),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: "Enter your 6 digit pin to confirm",
                        fontSize: 16,
                        weight: FontWeight.w400,
                        color: AppColours.lightGrey),
                    addVerticalSpace(24),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      cursorColor: AppColours.dayTritBlue,
                      cursorHeight: 15,
                      keyboardType: TextInputType.number,
                      showCursor: false,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      blinkDuration: const Duration(microseconds: 300),
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          borderWidth: 1,
                          activeFillColor: AppColours.lightGrey,
                          activeColor: AppColours.darkGrey,
                          inactiveColor: AppColours.grey4,
                          inactiveFillColor: AppColours.monochromeWhite,
                          selectedColor: AppColours.dayTritPrimaryColor,
                          selectedFillColor: AppColours.white,
                          errorBorderColor: AppColours.red),
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      // controller: textEditingController,
                      onCompleted: (v) {
                        if (v.isEmpty) {
                          print("Pin requested");
                        }
                        print("Completed");
                      },
                      onChanged: (dynamic value) =>
                          validationViewModel.setVerification(value),
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                    addVerticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            context: context,
                            title: "Didn't get any the code? ",
                            fontSize: 14,
                            weight: FontWeight.w400,
                            color: AppColours.deepBlue),
                        TextButton(
                            onPressed: () =>
                                snackBar("Verification code resent!!"),
                            child: getText(
                                context: context,
                                title: "Resend Code",
                                fontSize: 14,
                                weight: FontWeight.w500,
                                color: AppColours.red5))
                      ],
                    ),
                    addVerticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CustomButton(
                          height: 52,
                          width: double.infinity,
                          buttonName: "Next",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          buttonColor:
                              validationViewModel.verificationCode.error != null
                                  ? Colors.grey
                                  : AppColours.black,
                          onPressed: () {
                            validationViewModel.resetLogInFields();
                            validationViewModel.verificationCode.error != null
                                ? null
                                // : openLoginScreen(context);
                                : validationViewModel
                                    .submitCodeForEmailVerification(context,
                                        isPasswordResetProcess: false);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
