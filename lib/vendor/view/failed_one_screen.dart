import 'package:daytrit/vendor/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/size_utils.dart';
import '../widgets/common_image_view.dart';

class FailedOneScreen extends StatelessWidget {
  const FailedOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.gray50,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black45,
              ),
              onTap: () => Navigator.pop(context),
            )),
        body: SizedBox(
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getHorizontalSize(
                    253.00,
                  ),
                  margin: getMargin(
                    left: 61,
                    top: 114,
                    right: 61,
                  ),
                  child: Text(
                    "Your transaction failed\nto confirm",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColours.bluegray700,
                      fontSize: getFontSize(
                        26,
                      ),
                      fontFamily: 'Aeonik',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getHorizontalSize(
                    94.00,
                  ),
                  margin: getMargin(
                    left: 61,
                    top: 28,
                    right: 61,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        47.00,
                      ),
                    ),
                    border: Border.all(
                      color: AppColours.redA700,
                      width: getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              47.00,
                            ),
                          ),
                          child: CommonImageView(
                            svgPath: AppImages.imgX,
                            height: getSize(
                              94.00,
                            ),
                            width: getSize(
                              94.00,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getHorizontalSize(
                    209.00,
                  ),
                  margin: getMargin(
                    left: 61,
                    top: 26,
                    right: 61,
                  ),
                  child: Text(
                    "Your transaction failed to complete\n\nPlease make sure your trit coins balance is complete for the order(s).",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColours.gray700,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Aeonik',
                      fontWeight: FontWeight.w700,
                      height: 1.64,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 61,
                    top: 27,
                    right: 61,
                    bottom: 203,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomButton(
                        width: 106,
                        text: "Close",
                        variant: ButtonVariant.OutlineGray501,
                        padding: ButtonPadding.PaddingAll12,
                        fontStyle: ButtonFontStyle.AeonikBold14Gray501,
                      ),
                      CustomButton(
                        width: 106,
                        text: "Try again",
                        margin: getMargin(
                          left: 24,
                        ),
                        padding: ButtonPadding.PaddingAll12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
