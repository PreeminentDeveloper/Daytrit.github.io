import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/buttons/regular/custom_button_with_leading_logo.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/login_view_model.dart';
import 'package:daytrit/authentication/view_models/login_with_google_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/validation_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationModel>(context);
    // final loginWithFacebookViewModel =
    //     Provider.of<LoginWithFacebookViewModel>(context);
    final loginWithGoogleViewModel =
    Provider.of<LoginWithGoogleViewModel>(context);
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: loginViewModel.loading ||
              // loginWithFacebookViewModel.loading ||
              loginWithGoogleViewModel.loading,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 60),
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
                        title: "Login",
                        fontSize: 32,
                        color: AppColours.navyBlue,
                        weight: FontWeight.w700),
                    addVerticalSpace(25),
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
                      style: const TextStyle(color: AppColours.black, fontSize: 20),
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                      ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
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
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => openForgotPassword(context),
                        child: getText(
                            context: context,
                            title: "Forgot Password",
                            fontSize: 14,
                            color: AppColours.blue),
                      ),
                    ),
                    addVerticalSpace(32),
                    CustomButton(
                        buttonName: "Next",
                        buttonTextColor: AppColours.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 52,
                        width: double.infinity,
                        buttonColor: validationViewModel.isLoginValid
                            ? AppColours.black
                            : AppColours.lightGrey,
                        onPressed: () => !validationViewModel.isLoginValid
                            ? null
                            : validationViewModel.submitLogInData(context)),
                    addVerticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            context: context,
                            title: "Don't have an account?",
                            color: AppColours.grey,
                            fontSize: 16),
                        addHorizontalSpace(8),
                        InkWell(
                          onTap: () {
                            openSignUpScreen(context);
                            validationViewModel.resetSignUpFields();
                            validationViewModel.toggleObscurePassword(false);
                          },
                          child: getText(
                              context: context,
                              title: "Create Account",
                              color: AppColours.red,
                              weight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    addVerticalSpace(25),
                    const Divider(
                      color: AppColours.grey3,
                    ),
                    addVerticalSpace(17),
                    CustomButtonWithLeadingLogo(
                        buttonName: "Continue with Google",
                        buttonLogo: AppImages.google,
                        buttonColor: Colors.transparent,
                        onPressed: () {}),
                    // => validationViewModel.continueWithGoogle(context)),
                    addVerticalSpace(8),
                    CustomButtonWithLeadingLogo(
                        buttonName: "Continue with Facebook",
                        buttonLogo: AppImages.facebook,
                        buttonColor: Colors.transparent,
                        onPressed: () {}),
                    // => loginWithFacebookViewModel.checkIfIsLogged()),
                    addVerticalSpace(8),
                    CustomButtonWithLeadingLogo(
                        buttonName: "Continue with Apple",
                        buttonLogo: AppImages.apple,
                        buttonColor: Colors.transparent,
                        onPressed: () {}),
                  ]),
            ),
          ),
        ));
  }
}