import 'package:daytrit/authentication/components/buttons/dropdown/custom_dropdown_button.dart';
import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/register_view_model.dart';
import 'package:daytrit/authentication/view_models/validation_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final List<String> location = [
    'Lagos',
    'Abuja',
    'Porthacourt',
    'Kano',
    'Ogun'
  ];

  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationModel>(context);
    final registerViewModel = Provider.of<RegisterViewModel>(context);
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: registerViewModel.loading,
      progressIndicator: const Loader(),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 60, bottom: 30),
          decoration: const BoxDecoration(color: AppColours.monochromeWhite),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.dayTritOfficialLogo,
                ),
                addVerticalSpace(40),
                getText(
                    context: context,
                    title: "Create Account",
                    fontSize: 32,
                    color: AppColours.darkLemon,
                    weight: FontWeight.w700),
                addVerticalSpace(25),
                CustomInputField(
                  hintText: "Full Name",
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  errorText: validationViewModel.fullName.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setFullName(value),
                ),
                addVerticalSpace(12),
                CustomInputField(
                  hintText: "Email",
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  errorText: validationViewModel.email.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setEmail(value),
                ),
                addVerticalSpace(12),
                CustomInputField(
                  hintText: "Password",
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  obscureText: validationViewModel.obscurePassword,
                  suffixIcon: IconButton(
                    icon: Image(
                        image: AssetImage(validationViewModel.obscurePassword
                            ? AppImages.passwordVisibilityOff
                            : AppImages.passwordVisibilityOn)),
                    onPressed: () {
                      validationViewModel.toggleObscurePassword(
                          validationViewModel.obscurePassword);
                    },
                  ),
                  errorText: validationViewModel.password.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setPassword(value),
                ),
                addVerticalSpace(12),
                CustomDropdownButton(
                  hintText: "Select Location",
                  items: location
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: getText(
                                context: context,
                                title: item,
                                fontSize: 20,
                                color: AppColours.black),
                          ))
                      .toList(),
                  selectedValue: validationViewModel.selectedStatus,
                  onChanged: (dynamic value) =>
                      validationViewModel.setLocation(value),
                ),
                CustomInputField(
                  hintText: "Enter Phone",
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  errorText: validationViewModel.phoneNumber.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setPhoneNumber(value),
                ),
                addVerticalSpace(12),
                CustomInputField(
                  hintText: "Referral Code (Optional)",
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  errorText: validationViewModel.referralCode.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setReferralCode(value),
                ),
                addVerticalSpace(45),
                Column(
                  children: [
                    CustomButton(
                      buttonName: "Create an Account",
                      buttonTextColor: AppColours.white,
                      height: 52,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      width: double.infinity,
                      buttonColor: validationViewModel.isSignUpValid
                          ? AppColours.black
                          : AppColours.lightGrey,
                      onPressed: () => !validationViewModel.isSignUpValid
                          ? null
                          : validationViewModel.submitSignUpData(context),
                    ),
                    addVerticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            context: context,
                            title: "Already have an account?",
                            color: AppColours.grey,
                            fontSize: 16),
                        addHorizontalSpace(8),
                        InkWell(
                          onTap: () {
                            openLoginScreen(context);
                            validationViewModel.resetLogInFields();
                            validationViewModel.toggleObscurePassword(false);
                          },
                          child: getText(
                              context: context,
                              title: "Log In",
                              color: AppColours.red2,
                              weight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
        ),
      ),
    ));
  }
}
