import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
          backgroundColor: AppColours.white,
          elevation: 0,
          title: Text(
            'Booking Summary',
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
            addVerticalSpace(60),
            Container(
              height: 450,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColours.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '14:20 (LOS)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: AppColours.black),
                            ),
                            addVerticalSpace(5),
                            getText(
                                context: context,
                                title: 'Murtala Muhammed...',
                                weight: FontWeight.w600,
                                color: AppColours.gray700,
                                fontSize: 14),
                            addVerticalSpace(5),
                            Text(
                              'Lagos',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColours.gray700),
                            ),
                            addVerticalSpace(10),
                            Text(
                              'Depart',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: AppColours.black),
                            ),
                            addVerticalSpace(5),
                            Text(
                              '26/06/23',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColours.gray500),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SvgPicture.asset('assets/svgs/flight.svg'),
                            ),
                            addVerticalSpace(40),
                            Text(
                              '0 stop',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: AppColours.gray500),
                            ),
                            addVerticalSpace(3),
                            Text(
                              '13 h 38m',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColours.gray500),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '15:35 (LHS)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: AppColours.black),
                            ),
                            addVerticalSpace(5),
                            getText(
                                context: context,
                                title: 'Heathrow Airport...',
                                weight: FontWeight.w600,
                                color: AppColours.gray700,
                                fontSize: 14),
                            addVerticalSpace(5),
                            Text(
                              'London',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColours.gray500),
                            ),
                            addVerticalSpace(10),
                            Text(
                              'Arrive',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColours.black),
                            ),
                            addVerticalSpace(5),
                            Text(
                              '26/0/23',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColours.gray500),
                            )
                          ],
                        ),
                      ],
                    ),
                    addVerticalSpace(15),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColours.grey500,
                    ),
                    addVerticalSpace(15),
                    getText(
                        context: context,
                        title: 'Flight Base Fare',
                        fontSize: 20,
                        weight: FontWeight.w600,
                        color: AppColours.black),
                    addVerticalSpace(5),
                    getText(
                        context: context,
                        title: 'Adults x 1',
                        fontSize: 16,
                        weight: FontWeight.w600,
                        color: AppColours.gray500),
                    addVerticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                            context: context,
                            title: 'Base Fare',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.gray500),
                        getText(
                            context: context,
                            title: '\$885',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.black)
                      ],
                    ),
                    addVerticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                            context: context,
                            title: 'Discount',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.gray500),
                        getText(
                            context: context,
                            title: '\$885',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.black)
                      ],
                    ),
                    addVerticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                            context: context,
                            title: 'Total Fare',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.gray500),
                        getText(
                            context: context,
                            title: '\$885',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.black)
                      ],
                    ),
                    addVerticalSpace(20),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColours.grey500,
                    ),
                    addVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                            context: context,
                            title: 'Total',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColours.gray500),
                        getText(
                            context: context,
                            title: '\$885',
                            fontSize: 20,
                            weight: FontWeight.w600,
                            color: AppColours.black)
                      ],
                    ),
                    addVerticalSpace(20),
                    CustomButton(
                        buttonName: "PAY NOW",
                        buttonTextColor: AppColours.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 52,
                        width: double.infinity,
                        buttonColor: AppColours.red3,
                        onPressed: () {
                          openTravelersDetailsScreen(context);
                        })
                  ]),
            ),
          ]),
        )
      ]),
    );
  }
}
