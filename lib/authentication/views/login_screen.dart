import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/buttons/regular/custom_button_with_leading_logo.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/sizes.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/login_view_model.dart';
import 'package:daytrit/authentication/view_models/login_with_google_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

SizedBox addPaddingWhenKeyboardAppears() {
  final viewInsets = EdgeInsets.fromWindowPadding(
    WidgetsBinding.instance!.window.viewInsets,
    WidgetsBinding.instance!.window.devicePixelRatio,
  );

  final bottomOffset = viewInsets.bottom;
  const hiddenKeyboard = 0.0; // Always 0 if keyboard is not opened
  final isNeedPadding = bottomOffset != hiddenKeyboard;

  return SizedBox(height: isNeedPadding ? bottomOffset : hiddenKeyboard);
}

/// The size of the screen.
class ScreenSizeService {
  final BuildContext context;

  const ScreenSizeService(
    this.context,
  );

  Size get size => MediaQuery.of(context).size;
  double get height => size.height;
  double get width => size.width;
}

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomFlushBar customFlushBar = CustomFlushBar();
    final validationViewModel = Provider.of<ValidationViewModel>(context);
    // final loginWithFacebookViewModel =
    //     Provider.of<LoginWithFacebookViewModel>(context);
    final loginWithGoogleViewModel =
        Provider.of<LoginWithGoogleViewModel>(context);
    final loginViewModel = Provider.of<LoginViewModel>(context);

    final screenWidth = ScreenSizeService(context).width;
    final screenHeight = ScreenSizeService(context).height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColours.monochromeWhite,
        body: ModalProgressHUD(
          inAsyncCall: loginViewModel.loading ||
              // loginWithFacebookViewModel.loading ||
              loginWithGoogleViewModel.loading,
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
                    // height: height(context) * 0.5,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    decoration:
                        BoxDecoration(color: AppColours.monochromeWhite),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getText(
                              context: context,
                              title: "Welcome",
                              fontSize: 32,
                              color: AppColours.navyBlue,
                              weight: FontWeight.w700),
                          addVerticalSpace(10),
                          getText(
                              context: context,
                              title: "Login to your account",
                              fontSize: 16,
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
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
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
                                color: AppColours.black, fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
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
                          addVerticalSpace(8),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () => openForgotPassword(context),
                              child: getText(
                                  context: context,
                                  title: "Forgot Password",
                                  fontSize: 14,
                                  color: AppColours.red),
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
                                  ? AppColours.officialColor
                                  : Color.fromARGB(255, 162, 203, 194),
                              onPressed: () => !validationViewModel.isLoginValid
                                  ? null
                                  : validationViewModel
                                      .submitLogInData(context)),
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
                                  openSignUpType(context);
                                  validationViewModel.resetSignUpFields();
                                  validationViewModel
                                      .toggleObscurePassword(false);
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
                          // addVerticalSpace(16),
                          // const Divider(
                          //   color: AppColours.grey3,
                          // ),
                          // addVerticalSpace(17),
                          // CustomButtonWithLeadingLogo(
                          //     buttonName: "Continue with Google",
                          //     buttonLogo: AppImages.google,
                          //     buttonColor: Colors.transparent,
                          //     onPressed: () => customFlushBar.showSuccessFlushBar(
                          //         title: 'Coming soon!',
                          //         body: "Feature not available on this version",
                          //         context: context)),
                          // // => validationViewModel.continueWithGoogle(context)),
                          // addVerticalSpace(8),
                          // CustomButtonWithLeadingLogo(
                          //     buttonName: "Continue with Facebook",
                          //     buttonLogo: AppImages.facebook,
                          //     buttonColor: Colors.transparent,
                          //     onPressed: () => customFlushBar.showSuccessFlushBar(
                          //         title: 'Coming soon!',
                          //         body: "Feature not available on this version",
                          //         context: context)),
                          // // => loginWithFacebookViewModel.checkIfIsLogged()),
                          // addVerticalSpace(8),
                          // CustomButtonWithLeadingLogo(
                          //     buttonName: "Continue with Apple",
                          //     buttonLogo: AppImages.apple,
                          //     buttonColor: Colors.transparent,
                          //     onPressed: () => customFlushBar.showSuccessFlushBar(
                          //         title: 'Coming soon!',
                          //         body: "Feature not available on this version",
                          //         context: context)),
                          addPaddingWhenKeyboardAppears(),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
