import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  Color buttonColor, borderColor, buttonTextColor;
  dynamic onPressed;
  double fontSize;
  double borderRadius;
  FontWeight fontWeight;
  double height, width;
  CustomButton(
      {Key? key,
      required this.buttonName,
      this.height = 36,
      this.width = 109,
      this.fontSize = 13,
      this.fontWeight = FontWeight.w600,
      this.borderRadius = 5,
      this.buttonColor = AppColours.dayTritBlue,
      this.buttonTextColor = Colors.white,
      this.borderColor = Colors.transparent,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor)),
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
            child: getText(
                context: context,
                title: buttonName,
                fontSize: fontSize,
                color: buttonTextColor,
                weight: fontWeight)),
      ),
    );
  }
}
