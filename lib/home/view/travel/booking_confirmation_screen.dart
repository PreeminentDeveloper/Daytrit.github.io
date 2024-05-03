import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
          backgroundColor: AppColours.white,
          elevation: 0,
          title: Text(
            'Confirmation',
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
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            addVerticalSpace(120),
            SvgPicture.asset('assets/svgs/check.svg'),
            addVerticalSpace(50),
            getText(
                context: context,
                title: 'Ticket purchased successfully',
                fontSize: 17,
                weight: FontWeight.w500,
                color: AppColours.white),
            addVerticalSpace(5),
            getText(
                context: context,
                title: 'Download your ticket with the button below',
                fontSize: 17,
                weight: FontWeight.w500,
                color: AppColours.white),
            addVerticalSpace(200),
            CustomButton(
                buttonName: "DOWNLOAD TICKET",
                buttonTextColor: AppColours.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 60,
                width: double.infinity,
                buttonColor: AppColours.white,
                onPressed: () {})
          ]),
        )
      ]),
    );
  }
}
