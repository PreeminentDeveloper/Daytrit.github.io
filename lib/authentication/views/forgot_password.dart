import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/forgot_password_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../components/input_field/custom_input_field.dart';
import '../components/loader/loader.dart';
import '../view_models/validation_model.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationModel>(context);
    final forgotPasswordViewModel =
    Provider.of<ForgotPasswordViewModel>(context);

    return Scaffold(
      backgroundColor: AppColours.monochromeWhite2,
      body: ModalProgressHUD(
        inAsyncCall: forgotPasswordViewModel.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 61, bottom: 42),
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(context),
                        child: Icon(Icons.arrow_back_ios)),
                  ),
                  getText(
                      context: context,
                      title: "Forgot Password?",
                      fontSize: 28,
                      weight: FontWeight.w700,
                      color: AppColours.deepBlue),
                  getText(
                      context: context,
                      title: "Relax. We’ll handle this together.",
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: AppColours.grey3),
                  addVerticalSpace(107),
                  RichText(
                    text: TextSpan(
                      text:
                      'Please fill in the email address registered with your ',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColours.deepBlue),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'DayTrit account',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColours.red),
                        ),
                        TextSpan(text: ' to get a reset code'),
                      ],
                    ),
                  ),
                  addVerticalSpace(25),
                  CustomInputField(
                    hintText: "Email",
                    style: const TextStyle(
                        color: AppColours.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    errorText: validationViewModel.email.error,
                    onChanged: (dynamic value) =>
                        validationViewModel.setEmail(value),
                  ),
                  addVerticalSpace(48),
                  CustomButton(
                      buttonName: "Send Code",
                      buttonTextColor: AppColours.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 52,
                      width: double.infinity,
                      buttonColor: validationViewModel.isEmalValid
                          ? AppColours.black
                          : AppColours.lightGrey,
                      onPressed: ()
                      // => openResetCode(context)
                      =>
                      !validationViewModel.isEmalValid
                          ? null
                          : validationViewModel
                          .submitForgotPassword(context)),
                ]),
          ),
        ),
      ),
    );
  }
}