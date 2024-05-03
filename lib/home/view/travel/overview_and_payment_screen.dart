import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';

class OverviewAndPaymentScreen extends StatelessWidget {
  const OverviewAndPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
          backgroundColor: AppColours.white,
          elevation: 0,
          title: Text(
            'Overview & Payment',
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                32,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: Column(children: [
        addVerticalSpace(20),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColours.dayTritPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          height: 670,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            addVerticalSpace(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getText(
                      context: context,
                      title: 'Pay with Card',
                      fontSize: 20,
                      weight: FontWeight.w500,
                      color: AppColours.white),
                  getText(
                      context: context,
                      title: '\$800',
                      fontSize: 20,
                      weight: FontWeight.w500,
                      color: AppColours.white),
                ],
              ),
            ),
            addVerticalSpace(20),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColours.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: 'Supported payment methods',
                        fontSize: 17,
                        weight: FontWeight.w500,
                        color: AppColours.black),
                    addVerticalSpace(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                            context: context,
                            title: 'VISA',
                            fontSize: 18,
                            weight: FontWeight.w500,
                            color: AppColours.black),
                        getText(
                            context: context,
                            title: 'MASTERCARD',
                            fontSize: 18,
                            weight: FontWeight.w500,
                            color: AppColours.black),
                        getText(
                            context: context,
                            title: 'VERVE',
                            fontSize: 18,
                            weight: FontWeight.w500,
                            color: AppColours.black),
                      ],
                    )
                  ]),
            ),
            addVerticalSpace(75),
            Center(
                child: getText(
                    context: context,
                    title: '\$800',
                    fontSize: 25,
                    weight: FontWeight.w500,
                    color: AppColours.white)),
            addVerticalSpace(10),
            CustomButton(
                buttonName: "PAY NOW",
                buttonTextColor: AppColours.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 60,
                width: double.infinity,
                buttonColor: AppColours.white,
                onPressed: () {
                  openBookingConfirmationScreen(context);
                })
          ]),
        )
      ]),
    );
  }
}
