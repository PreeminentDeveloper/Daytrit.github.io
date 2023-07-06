import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String? content,
      required dynamic okBtnFunction,
      required double width,
      required double height,
      required Color bgColor}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getText(
                        textAlign: TextAlign.center,
                        context: context,
                        title: content!,
                        color: AppColours.blue2,
                        fontSize: 18.2,
                        weight: FontWeight.w500),
                    addVerticalSpace(22),
                    TextButton(
                      onPressed: okBtnFunction,
                      child: Container(
                        width: 89.25,
                        height: 36,
                        decoration: BoxDecoration(
                            color: AppColours.lemon3,
                            borderRadius: BorderRadius.circular(3.44),
                            border: Border.all(color: AppColours.lemon2)),
                        child: Center(
                          child: getText(
                              context: context,
                              title: "Okay",
                              fontSize: 16,
                              color: AppColours.blue2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
