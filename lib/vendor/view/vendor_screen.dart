import 'dart:convert';

import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:daytrit/vendor/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_utils.dart';
import '../widgets/common_image_view.dart';
import 'checkout_screen.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VendorViewModel>(context);
    print(jsonEncode((viewModel.vendors[viewModel.selectedVendor])));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.whiteA700,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black45,
                        ),
                      )))),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CommonImageView(
                  url:
                      "https://daytrit.net${viewModel.vendors[viewModel.selectedVendor].photo}",
                  fit: BoxFit.cover,
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
                    "${viewModel.vendors[viewModel.selectedVendor].title}",
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
                          "${viewModel.vendors[viewModel.selectedVendor].country}, ${viewModel.vendors[viewModel.selectedVendor].state}",
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
                          initialRating: double.parse(
                              "${viewModel.vendors[viewModel.selectedVendor].rating ?? 0}"),
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: getVerticalSize(
                            16.00,
                          ),
                          itemCount: 4,
                          updateOnDrag: true,
                          onRatingUpdate: (rating) {},
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
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
                      viewModel.vendors[viewModel.selectedVendor].cashPrice !=
                              null
                          ? Container(
                              height: 45.00,
                              width: 150.00,
                              margin: getMargin(
                                left: 8,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabled: false,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText:
                                        "${viewModel.vendors[viewModel.selectedVendor].cashPrice}",
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
                            )
                          : SizedBox(),
                      viewModel.vendors[viewModel.selectedVendor].coinPrice !=
                              null
                          ? Container(
                              height: 45.00,
                              width: 150.00,
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
                                    hintText:
                                        "${viewModel.vendors[viewModel.selectedVendor].coinPrice}",
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
                            )
                          : SizedBox(),
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
                  "${viewModel.vendors[viewModel.selectedVendor].description}",
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
              if (viewModel.vendors[viewModel.selectedVendor].features != null)
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
                          child: Padding(
                            padding: getPadding(
                              right: 12,
                              left: 12,
                            ),
                            child: Text(
                              "${viewModel.vendors[viewModel.selectedVendor].features?.trim()}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColours.bluegray90099,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Aeonik',
                                  fontWeight: FontWeight.w700,
                                  height: 2.21),
                            ),
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
                    "More images ",
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
                      color: AppColours.transparent,
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
                          color: AppColours.transparent,
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
                                  url:
                                      "https://daytrit.net${viewModel.vendors[viewModel.selectedVendor].photo2}",
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
                      color: AppColours.transparent,
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
                          color: AppColours.transparent,
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
                                  url:
                                      "https://daytrit.net${viewModel.vendors[viewModel.selectedVendor].photo3}",
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
                            url:
                                "https://daytrit.net${viewModel.vendors[viewModel.selectedVendor].photo4}",
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
              viewModel.vendors[viewModel.selectedVendor].coinPrice != null &&
                      viewModel.vendors[viewModel.selectedVendor].coinPrice !=
                          '0'
                  ? CustomButton(
                      width: 351,
                      text: "Apply with Trit coins",
                      margin: getMargin(
                        left: 12,
                        top: 84,
                        right: 12,
                      ),
                      shape: ButtonShape.RoundedBorder27,
                      onTap: () {
                        if (viewModel.vendors[viewModel.selectedVendor]
                                .requiredCheckoutField?.isEmpty ==
                            true) {
                          viewModel.customFlushBar.showErrorFlushBar(
                              title: 'Notification',
                              body:
                                  "This package has not been completely setup for your maximum usage. Kindly be patient and try another time.",
                              context: context);
                          return;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckoutScreen()));
                      })
                  : SizedBox(),
              viewModel.vendors[viewModel.selectedVendor].cashPrice != null &&
                      viewModel.vendors[viewModel.selectedVendor].cashPrice !=
                          '0'
                  ? CustomButton(
                      width: 351,
                      text: "Apply with Credit card",
                      margin: getMargin(
                        left: 12,
                        top: 8,
                        right: 12,
                      ),
                      variant: ButtonVariant.FillRed100,
                      shape: ButtonShape.RoundedBorder27,
                      fontStyle: ButtonFontStyle.AeonikBold14DeeporangeA400,
                      onTap: () {
                        if (viewModel.vendors[viewModel.selectedVendor]
                                .requiredCheckoutField?.isEmpty ==
                            true) {
                          viewModel.customFlushBar.showErrorFlushBar(
                              title: 'Notification',
                              body:
                                  "This package has not been completely setup for your maximum usage. Kindly be patient and try another time.",
                              context: context);
                          return;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckoutScreen()));
                      })
                  : SizedBox(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
