import 'package:daytrit/authentication/components/dialog/custom_dialog.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/sizes.dart';
import 'package:daytrit/authentication/views/forgot_password.dart';
import 'package:daytrit/authentication/views/login_screen.dart';
import 'package:daytrit/authentication/views/onboarding/screens/terms_and_conditions.dart';
import 'package:daytrit/authentication/views/reset_code.dart';
import 'package:daytrit/authentication/views/signup_screen.dart';
import 'package:daytrit/authentication/views/verification_screen.dart';
import 'package:daytrit/authentication/views/welcome.dart';
import 'package:daytrit/home/components/bottom_nav_bar/bottom_nav.dart';
import 'package:daytrit/home/models/dataModel/explore_model.dart';
import 'package:daytrit/home/view/edit_profile_screen.dart';
import 'package:daytrit/home/view/explore/video_player/screen/video_payer_screen.dart';
import 'package:daytrit/home/view/privacy_policy_screen.dart';
import 'package:daytrit/home/view/profile_screen.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

import '../authentication/components/buttons/regular/custom_botton.dart';
import '../authentication/components/custom_text/get_text.dart';
import '../authentication/components/screen_properties.dart/spaces.dart';
import '../authentication/views/new_password.dart';
import '../vendor/view/vendor_container.dart';

// routes
void openLoginScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LogInScreen()));
}

void openLoginScreenWithReplacement(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LogInScreen()));
}

void openLogOut(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
      (route) => false);
  // Navigator.Re(
  //     context, MaterialPageRoute(builder: (context) => const LogInScreen()));
}

void openTermsAndAgreement(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => TermsAndConditions()));
}

void openSignUpScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignUpScreen()));
}

void openVerificationScreen(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => VerificationScreen()));
}

void openForgotPassword(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ForgotPassword()));
}

void openResetCode(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetCode()));
}

void openNewPassword(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => NewPassword()));
}

void openWelcomeScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
}  

void editProfileScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
}  
void privacyPolicyScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
}  
void openBottomNavBar(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const BottomNav()));
}
void openProfileScreen(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
}

void modalBottomSheetMenu(BuildContext context,
    {required String message,
    required String buttonName,
    required dynamic onPressed}) {
  showModalBottomSheet(  
      context: context,
      // isDismissible: false,
      builder: (builder) {
        return Container(
            height: height(context) - 306,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 43),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage(AppImages.check)),
                  getText(
                      context: context,
                      title: "Smooth!",
                      fontSize: 20,
                      weight: FontWeight.w400,
                      color: AppColours.deepBlue),
                  addVerticalSpace(32),
                  getText(
                      context: context,
                      textAlign: TextAlign.center,
                      title: message,
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: AppColours.deepBlue),
                  addVerticalSpace(32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomButton(
                        height: 52,
                        width: double.infinity,
                        buttonName: buttonName,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        buttonColor: AppColours.black,
                        onPressed: onPressed),
                  ),
                ],
              ),
            ));
      });
}

void openvendorContainerNav(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const VendorContainerNav()));
}

void openVideoPlayerScreen(
    {BuildContext? context, List<Datum>? videoData, int? videoIndex}) {
  Navigator.push(
      context!,
      MaterialPageRoute(
          builder: (context) =>
              VideoPlayerScreen(videoData: videoData, videoIndex: videoIndex)));
}

void openCustomDialogOnDeleteAccount(
    {required BuildContext context, content, dynamic okBtnFunction}) {
  DialogUtils.showCustomDialog(context,
      width: 311,
      height: 364,
      bgColor: AppColours.dayTritBlueLight,
      content: content,
      okBtnFunction: okBtnFunction);
}

void openCustomDialog({required BuildContext context, content}) {
  DialogUtils.showCustomDialog(context,
      width: 274,
      height: 205,
      bgColor: AppColours.dayTritBlueLight,
      content: content,
      okBtnFunction: () => openVerificationScreen(context));
}

void openCustomDialog2({required BuildContext context, content}) {
  DialogUtils.showCustomDialog(context,
      width: 311,
      height: 364,
      bgColor: AppColours.dayTritBlue2,
      content: content,
      okBtnFunction: () => openBottomNavBar(context));
}
