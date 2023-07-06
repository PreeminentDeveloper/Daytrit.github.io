import 'package:daytrit/vendor/widgets/custom_bottom_bar.dart';
import 'package:daytrit/vendor/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_utils.dart';
import '../../widgets/common_image_view.dart';

class VendorOneScreen extends StatelessWidget {
  BottomBarEnum type = BottomBarEnum.Home;

  VendorOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.whiteA700,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CommonImageView(
                  imagePath: AppImages.imgMtndataflyer,
                  height: getVerticalSize(
                    470.00,
                  ),
                  width: getHorizontalSize(
                    375.00,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 33,
                    right: 16,
                  ),
                  child: Text(
                    "MTN 6GB DATA",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColours.gray901,
                      fontSize: getFontSize(
                        36,
                      ),
                      fontFamily: 'Aeonik',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 2,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 1,
                          bottom: 3,
                        ),
                        child: CommonImageView(
                          svgPath: AppImages.imgEye,
                          height: getSize(
                            16.00,
                          ),
                          width: getSize(
                            16.00,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 2,
                        ),
                        child: Text(
                          "Lagos, Nigeria",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColours.gray600,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Aeonik',
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 1,
                          bottom: 2,
                        ),
                        child: RatingBar.builder(
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemSize: getVerticalSize(
                            16.00,
                          ),
                          itemCount: 4,
                          updateOnDrag: true,
                          onRatingUpdate: (rating) {},
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 12,
                    top: 13,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: getVerticalSize(
                          45.00,
                        ),
                        width: getHorizontalSize(
                          130.00,
                        ),
                        margin: getMargin(
                          left: 8,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabled: false,
                              contentPadding: EdgeInsets.all(10),
                              hintText: "N12,500",
                              hintStyle: TextStyle(
                                color: AppColours.bluegray900,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Aeonik',
                                fontWeight: FontWeight.w700,
                              ),
                              label: Text(
                                "Price",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray500,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          45.00,
                        ),
                        width: getHorizontalSize(
                          130.00,
                        ),
                        margin: getMargin(
                          left: 8,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabled: false,
                              prefixIcon: Container(
                                padding: getPadding(
                                  top: 10,
                                  right: 10,
                                  left: 10,
                                  bottom: 10,
                                ),
                                child: CommonImageView(
                                    svgPath: AppImages.imgCoins,
                                    height: 5,
                                    width: 5),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "16,000",
                              hintStyle: TextStyle(
                                color: AppColours.bluegray900,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Aeonik',
                                fontWeight: FontWeight.w700,
                              ),
                              label: Text(
                                "Trit coin",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray500,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  341.00,
                ),
                margin: getMargin(
                  left: 15,
                  top: 38,
                  right: 15,
                ),
                child: Text(
                  "No more worries running out of data-bites unexpectedly.  With this bountiful MTN 6GB data, you can now easily watch more Ads to earn more Trit coins to apply for Cakes and Chicken Box.",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColours.gray900A2,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontFamily: 'Aeonik',
                    fontWeight: FontWeight.w400,
                    height: 1.43,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: getMargin(
                  left: 15,
                  top: 41,
                  right: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColours.blue100,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      8.00,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 31,
                          top: 22,
                          right: 31,
                        ),
                        child: Text(
                          "Features",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontFamily: 'Aeonik',
                            fontWeight: FontWeight.w700,
                            height: 1.22,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: getMargin(
                          left: 17,
                          top: 9,
                          right: 17,
                          bottom: 24,
                        ),
                        decoration: BoxDecoration(
                          color: AppColours.blue100,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              21.89,
                            ),
                          ),
                          border: Border.all(
                            color: AppColours.bluegray900,
                            width: getHorizontalSize(
                              0.87,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 14,
                                bottom: 12,
                              ),
                              child: Text(
                                "Fast",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray90099,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 1.21,
                                ),
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                12.00,
                              ),
                              width: getHorizontalSize(
                                1.00,
                              ),
                              margin: getMargin(
                                left: 16,
                                top: 15,
                                bottom: 15,
                              ),
                              decoration: BoxDecoration(
                                color: AppColours.black90075,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 16,
                                top: 13,
                                bottom: 12,
                              ),
                              child: Text(
                                "Reliable",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray90099,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 1.21,
                                ),
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                12.00,
                              ),
                              width: getHorizontalSize(
                                1.00,
                              ),
                              margin: getMargin(
                                left: 16,
                                top: 15,
                                bottom: 15,
                              ),
                              decoration: BoxDecoration(
                                color: AppColours.black90075,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 16,
                                top: 13,
                                bottom: 12,
                              ),
                              child: Text(
                                "Unlimited",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray90099,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 1.21,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 46,
                    right: 16,
                  ),
                  child: Text(
                    "More images",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColours.bluegray700,
                      fontSize: getFontSize(
                        18,
                      ),
                      fontFamily: 'Aeonik',
                      fontWeight: FontWeight.w700,
                      height: 1.22,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 15,
                  top: 7,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: EdgeInsets.all(0),
                      color: AppColours.black900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      child: Container(
                        height: getVerticalSize(
                          172.00,
                        ),
                        width: getHorizontalSize(
                          168.00,
                        ),
                        decoration: BoxDecoration(
                          color: AppColours.black900,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              16.00,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    16.00,
                                  ),
                                ),
                                child: CommonImageView(
                                  imagePath: AppImages.imgMtndataflyer172x168,
                                  height: getVerticalSize(
                                    172.00,
                                  ),
                                  width: getHorizontalSize(
                                    168.00,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: getMargin(
                        left: 8,
                      ),
                      color: AppColours.black900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      child: Container(
                        height: getVerticalSize(
                          172.00,
                        ),
                        width: getHorizontalSize(
                          167.00,
                        ),
                        decoration: BoxDecoration(
                          color: AppColours.black900,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              16.00,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    16.00,
                                  ),
                                ),
                                child: CommonImageView(
                                  imagePath: AppImages.imgGroup131,
                                  height: getVerticalSize(
                                    172.00,
                                  ),
                                  width: getHorizontalSize(
                                    167.00,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: getMargin(
                  left: 15,
                  top: 8,
                  right: 15,
                ),
                color: AppColours.black900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Container(
                  height: getVerticalSize(
                    172.00,
                  ),
                  width: getHorizontalSize(
                    343.00,
                  ),
                  decoration: BoxDecoration(
                    color: AppColours.black900,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        16.00,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              16.00,
                            ),
                          ),
                          child: CommonImageView(
                            imagePath: AppImages.imgGroup111,
                            height: getVerticalSize(
                              172.00,
                            ),
                            width: getHorizontalSize(
                              343.00,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                width: 342,
                text: "Apply with Trit coins",
                margin: getMargin(
                  left: 15,
                  top: 44,
                  right: 15,
                ),
                shape: ButtonShape.RoundedBorder27,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
