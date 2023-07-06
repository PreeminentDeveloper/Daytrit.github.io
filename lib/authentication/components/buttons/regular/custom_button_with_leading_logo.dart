import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButtonWithLeadingLogo extends StatelessWidget {
  String buttonName, buttonLogo;
  Color buttonColor;
  double height;
  dynamic onPressed;
  CustomButtonWithLeadingLogo({
    required this.buttonName,
    required this.buttonLogo,
    required this.buttonColor,
    this.height = 52,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColours.forestLightGreen2)),
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(buttonLogo),
                color: AppColours.forestLightGreen2,
              ),
              addHorizontalSpace(8),
              getText(
                context: context,
                title: buttonName,
                color: AppColours.forestLightGreen2,
                weight: FontWeight.w500,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
