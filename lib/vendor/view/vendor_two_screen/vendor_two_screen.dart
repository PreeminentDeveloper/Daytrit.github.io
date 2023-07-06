import 'package:daytrit/vendor/view/checkout_screen.dart';
import 'package:daytrit/vendor/widgets/custom_bottom_bar.dart';
import 'package:daytrit/vendor/widgets/custom_button.dart';
import 'package:daytrit/vendor/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_utils.dart';
import '../../widgets/common_image_view.dart';

class VendorTwoScreen extends StatelessWidget {
  BottomBarEnum type = BottomBarEnum.Home;

  VendorTwoScreen({super.key});

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
                child: SizedBox(
                  height: getVerticalSize(
                    458.00,
                  ),
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: getVerticalSize(
                            458.00,
                          ),
                          width: size.width,
                          margin: getMargin(
                            bottom: 1,
                          ),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CommonImageView(
                                  imagePath: AppImages.imgCakeaddesign,
                                  height: getVerticalSize(
                                    458.00,
                                  ),
                                  width: getHorizontalSize(
                                    375.00,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: getVerticalSize(
                                    458.00,
                                  ),
                                  width: size.width,
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CommonImageView(
                                          imagePath:
                                              AppImages.imgUnsplashyqfoty,
                                          height: getVerticalSize(
                                            458.00,
                                          ),
                                          width: getHorizontalSize(
                                            375.00,
                                          ),
                                        ),
                                      ),
                                      CustomIconButton(
                                        height: 48,
                                        width: 48,
                                        margin: getMargin(
                                          left: 15,
                                          top: 48,
                                          right: 15,
                                          bottom: 48,
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: CommonImageView(
                                          svgPath:
                                              AppImages.imgArrowleftWhiteA701,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonImageView(
                          imagePath: AppImages.imgCakeaddesign458x375,
                          height: getVerticalSize(
                            458.00,
                          ),
                          width: getHorizontalSize(
                            375.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: getVerticalSize(
                  423.00,
                ),
                width: getHorizontalSize(
                  343.00,
                ),
                margin: getMargin(
                  left: 16,
                  top: 33,
                  right: 16,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: getPadding(
                          right: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: getPadding(
                                  right: 11,
                                ),
                                child: Text(
                                  "CAKES BY MEEMIE",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColours.bluegray900,
                                    fontSize: getFontSize(
                                      36,
                                    ),
                                    fontFamily: 'Aeonik',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 2,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
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
                            Padding(
                              padding: getPadding(
                                top: 13,
                                right: 10,
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(
                                327.00,
                              ),
                              margin: getMargin(
                                top: 38,
                              ),
                              child: Text(
                                "Topnotch cakes baked with high quality and trusted ingredients for every of your celebrations; birthdays, anniversary and weddings. Etc.\n\nNothing feels extraordinarily special without the memories gotten from experiencing fulfillment with a blissful Cake by Meemie.\r",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray700A2,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: getMargin(
                          top: 10,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 23,
                                top: 26,
                                right: 23,
                              ),
                              child: Text(
                                "Features",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColours.bluegray700,
                                  fontSize: getFontSize(
                                    15.586006164550781,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 1.22,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: getMargin(
                                  left: 23,
                                  top: 9,
                                  right: 23,
                                  bottom: 32,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColours.blue100,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      23.39,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 11,
                                        top: 16,
                                        bottom: 15,
                                      ),
                                      child: Text(
                                        "Fireworks",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColours.bluegray90099,
                                          fontSize: getFontSize(
                                            12.12244987487793,
                                          ),
                                          fontFamily: 'Aeonik',
                                          fontWeight: FontWeight.w700,
                                          height: 1.24,
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
                                        top: 16,
                                        bottom: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColours.black90075,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 16,
                                        top: 17,
                                        bottom: 14,
                                      ),
                                      child: Text(
                                        "Free Delivery",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColours.bluegray90099,
                                          fontSize: getFontSize(
                                            12.12244987487793,
                                          ),
                                          fontFamily: 'Aeonik',
                                          fontWeight: FontWeight.w700,
                                          height: 1.24,
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
                                        top: 16,
                                        bottom: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColours.black90075,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 16,
                                        top: 17,
                                        bottom: 14,
                                      ),
                                      child: Text(
                                        "Name Display",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColours.bluegray90099,
                                          fontSize: getFontSize(
                                            12.12244987487793,
                                          ),
                                          fontFamily: 'Aeonik',
                                          fontWeight: FontWeight.w700,
                                          height: 1.24,
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
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 48,
                    right: 16,
                  ),
                  child: Text(
                    "More images",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColours.gray601,
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
                  left: 16,
                  top: 12,
                  right: 16,
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
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                                  imagePath: AppImages.imgDavidholifield,
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
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                          alignment: Alignment.centerLeft,
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
                                  imagePath: AppImages.imgDanielhooperp,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    16.00,
                                  ),
                                ),
                                child: CommonImageView(
                                  imagePath: AppImages.imgNatallianagorn,
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
                  left: 16,
                  top: 9,
                  right: 16,
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
                            imagePath: AppImages.imgAmericanherita,
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
                width: 343,
                text: "Apply with Trit coins",
                margin: getMargin(
                  left: 16,
                  top: 44,
                  right: 16,
                ),
                shape: ButtonShape.RoundedBorder27,
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CheckoutScreen())),
              ),
              CustomButton(
                width: 343,
                text: "Apply with Credit card",
                margin: getMargin(
                  left: 16,
                  top: 8,
                  right: 16,
                ),
                variant: ButtonVariant.FillRed100,
                shape: ButtonShape.RoundedBorder27,
                fontStyle: ButtonFontStyle.AeonikBold14DeeporangeA400,
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CheckoutScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
