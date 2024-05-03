import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class SignUpType extends StatelessWidget {
  const SignUpType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 60),
        decoration: const BoxDecoration(color: AppColours.monochromeWhite),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.dayTritOfficialLogo,
              ),
              addVerticalSpace(130),
              CustomButton(
                  buttonName: "Sign Up",
                  buttonTextColor: AppColours.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 52,
                  width: double.infinity,
                  buttonColor: AppColours.officialColor,
                  onPressed: () => openSignUpScreen(context)),
              addVerticalSpace(30),
              CustomButton(
                  buttonName: "Become an Agent",
                  buttonTextColor: AppColours.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 52,
                  width: double.infinity,
                  buttonColor: AppColours.officialColor,
                  onPressed: () => openTravelRegisteration(context))
            ]),
      ),
    );
  }
}
