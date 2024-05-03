import 'package:country_picker/country_picker.dart';
import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/sizes.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/register_view_model.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/authentication/views/login_screen.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationViewModel>(context);
    final registerViewModel = Provider.of<RegisterViewModel>(context);

    final screenWidth = ScreenSizeService(context).width;
    final screenHeight = ScreenSizeService(context).height;

    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: registerViewModel.loading,
      progressIndicator: const Loader(),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: screenWidth,
            minHeight: screenHeight,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: height(context) * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                AppImages.roadTrip,
                              ),
                              fit: BoxFit.cover))),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 80,
                    child: Image.asset(
                      AppImages.dayTritOfficialLogoNameWhite,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                decoration:
                    const BoxDecoration(color: AppColours.monochromeWhite),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getText(
                          context: context,
                          title: "Create Account",
                          fontSize: 32,
                          color: AppColours.darkLemon,
                          weight: FontWeight.bold),
                      addVerticalSpace(25),
                      CustomInputField(
                        hintText: "Full Name",
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorText: validationViewModel.fullName.error,
                        onChanged: (dynamic value) =>
                            validationViewModel.setFullName(value),
                      ),
                      addVerticalSpace(12),
                      CustomInputField(
                        hintText: "Email Address",
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
                              image: AssetImage(
                                  validationViewModel.obscurePassword
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () => showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  hintText: 'Search Country',
                                  prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: AppColours.officialColor,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColours
                                            .officialColor), //<-- SEE HERE
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColours.officialColor),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                selectedStatus = country.displayName;
                                validationViewModel
                                    .setLocation(country.displayName);
                              }),
                          child: Container(
                              height: 50,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  // color: AppColours.black,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColours.forestLightGreen)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    validationViewModel.selectedStatus ??
                                        "Select Location",
                                    style: TextStyle(
                                        color: validationViewModel
                                                    .selectedStatus ==
                                                null
                                            ? AppColours.darkLemon2
                                            : AppColours.black,
                                        fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: AppColours.darkLemon2,
                                  )
                                ],
                              )),
                        ),
                      ),
                      CustomInputField(
                        hintText: "Phone Number",
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                                ? AppColours.officialColor
                                : Color.fromARGB(255, 162, 203, 194),
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
                                  validationViewModel
                                      .toggleObscurePassword(false);
                                },
                                child: getText(
                                    context: context,
                                    title: "Log In",
                                    color: AppColours.red2,
                                    weight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              addPaddingWhenKeyboardAppears(),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
