import 'package:daytrit/vendor/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/size_utils.dart';
import '../widgets/common_image_view.dart';
import 'failed_one_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.gray50,
        appBar: AppBar(
            backgroundColor: AppColours.gray50,
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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Your application is successful!",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: getMargin(
                  left: 83,
                  top: 28,
                  right: 83,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColours.greenA700,
                    width: getHorizontalSize(
                      4.00,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(47),
                ),
                child: Container(
                  height: getSize(
                    94.00,
                  ),
                  width: getSize(
                    94.00,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        47.00,
                      ),
                    ),
                    border: Border.all(
                      color: AppColours.greenA700,
                      width: getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 22,
                            top: 30,
                            right: 22,
                            bottom: 30,
                          ),
                          child: CommonImageView(
                            svgPath: AppImages.imgCheckmark,
                            height: getVerticalSize(
                              33.00,
                            ),
                            width: getHorizontalSize(
                              48.00,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 83,
                  top: 34,
                  right: 83,
                ),
                child: Text(
                  "Your booking ID is: 7564216",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColours.gray701,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontFamily: 'Aeonik',
                    fontWeight: FontWeight.w500,
                    height: 1.27,
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  148.00,
                ),
                margin: getMargin(
                  left: 83,
                  top: 16,
                  right: 83,
                ),
                child: Text(
                  "You will recieve a booking confirmation email with details of your order(s).",
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColours.gray701,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontFamily: 'Aeonik',
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                ),
              ),
              CustomButton(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FailedOneScreen())),
                width: 206,
                text: "Continue",
                margin: getMargin(
                  left: 83,
                  top: 25,
                  right: 83,
                ),
                padding: ButtonPadding.PaddingAll12,
              ),
              Padding(
                padding: getPadding(
                  left: 83,
                  top: 15,
                  right: 83,
                  bottom: 5,
                ),
                child: Text(
                  "Data will be credited within 24 hours",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColours.deepOrangeA200,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontFamily: 'Aeonik',
                    fontWeight: FontWeight.w700,
                    height: 1.25,
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
