import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/view/travel/booking_summary.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';

class TripSummary2Screen extends StatelessWidget {
  const TripSummary2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
          backgroundColor: AppColours.white,
          elevation: 0,
          title: Text(
            'Trip Summary',
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
      body: SingleChildScrollView(
        child: Column(children: [
          addVerticalSpace(20),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColours.dayTritPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 1000,
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: getText(
                    context: context,
                    title: 'Book now so you don’t miss out on\nthis price.',
                    color: AppColours.white,
                    fontSize: 20,
                    weight: FontWeight.w700),
              ),
              addVerticalSpace(20),
              Container(
                height: 700,
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
                          title: 'Departure flight: Lagos - London',
                          color: AppColours.dayTritPrimaryColor,
                          fontSize: 20,
                          weight: FontWeight.w600),
                      addVerticalSpace(10),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColours.grey500,
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: 'Thurs, Jun 29',
                          color: AppColours.grey500,
                          fontSize: 15,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      getText(
                          context: context,
                          title: '14:20 - 15:35',
                          color: AppColours.black,
                          fontSize: 18,
                          weight: FontWeight.w600),
                      addVerticalSpace(5),
                      getText(
                          context: context,
                          title:
                              'Lagos (Murtala Muhammed International Airport) (LOS) - London (Heathrow International Airport) (LHS)',
                          fontSize: 13,
                          weight: FontWeight.w600,
                          color: AppColours.black),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: 'Arik Air . 733 . Class L',
                          color: AppColours.grey500,
                          fontSize: 15,
                          weight: FontWeight.w600),
                      addVerticalSpace(20),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColours.grey500,
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: 'Economy',
                          color: AppColours.grey500,
                          fontSize: 18,
                          weight: FontWeight.w600),
                      getText(
                          context: context,
                          title: '1h 15m',
                          color: AppColours.black,
                          fontSize: 20,
                          weight: FontWeight.w600),
                      addVerticalSpace(20),
                      Container(
                        width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: AppColours.dayTritPrimaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              getText(
                                  context: context,
                                  title: 'Layover:',
                                  color: AppColours.dayTritPrimaryColor,
                                  fontSize: 15,
                                  weight: FontWeight.w700),
                              getText(
                                  context: context,
                                  title: 'at Addis Ababa(Addis Ababa)',
                                  color: AppColours.black,
                                  fontSize: 13,
                                  weight: FontWeight.w600)
                            ]),
                            getText(
                                context: context,
                                title: '1h 0m',
                                color: AppColours.black,
                                fontSize: 15,
                                weight: FontWeight.w700)
                          ],
                        ),
                      ),
                      addVerticalSpace(10),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColours.grey500,
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: 'Thurs, Jun 29',
                          color: AppColours.grey500,
                          fontSize: 15,
                          weight: FontWeight.w500),
                      getText(
                          context: context,
                          title: '14:20 - 15:35',
                          color: AppColours.black,
                          fontSize: 18,
                          weight: FontWeight.w600),
                      getText(
                          context: context,
                          title:
                              'Lagos (Murtala Muhammed International Airport) (LOS) - London (Heathrow International Airport) (LHS)',
                          fontSize: 13,
                          weight: FontWeight.w600,
                          color: AppColours.black),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: 'Arik Air . 733 . Class L',
                          color: AppColours.grey500,
                          fontSize: 15,
                          weight: FontWeight.w600),
                      addVerticalSpace(10),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColours.grey500,
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: 'Economy',
                          color: AppColours.grey500,
                          fontSize: 18,
                          weight: FontWeight.w600),
                      getText(
                          context: context,
                          title: '1h 15m',
                          color: AppColours.black,
                          fontSize: 20,
                          weight: FontWeight.w600),
                      addVerticalSpace(20),
                      Container(
                        width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: AppColours.dayTritPrimaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              getText(
                                  context: context,
                                  title: 'Technical Stop:',
                                  color: AppColours.dayTritPrimaryColor,
                                  fontSize: 15,
                                  weight: FontWeight.w700),
                              getText(
                                  context: context,
                                  title: 'Dublin(DOB)',
                                  color: AppColours.black,
                                  fontSize: 13,
                                  weight: FontWeight.w600)
                            ]),
                            getText(
                                context: context,
                                title: '1h 0m',
                                color: AppColours.black,
                                fontSize: 15,
                                weight: FontWeight.w700)
                          ],
                        ),
                      ),
                      addVerticalSpace(20),
                      CustomButton(
                          buttonName: "2PCS x 23Kg",
                          buttonTextColor: AppColours.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 52,
                          width: double.infinity,
                          buttonColor: AppColours.red3,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingSummary()));
                          })
                    ]),
              ),
              addVerticalSpace(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: getText(
                    context: context,
                    title: '*Refundable (Penalty Applies).',
                    color: AppColours.white,
                    fontSize: 20,
                    weight: FontWeight.w500),
              ),
              addVerticalSpace(30),
              Container(
              height: 60,
              width: double.infinity,
              color: AppColours.white,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(
                          context: context,
                          title: '\$885',
                          color: AppColours.black,
                          fontSize: 16,
                          weight: FontWeight.w700),
                      getText(
                          context: context,
                          title: 'For 1 Adult',
                          color: AppColours.black,
                          fontSize: 16,
                          weight: FontWeight.w600)
                    ],
                  ),
                  CustomButton(
                      buttonName: "Continue",
                      buttonTextColor: AppColours.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 45,
                      width: 150,
                      buttonColor: AppColours.red3,
                      onPressed: () {})
                ],
              ),
            )
            ]),
          )
        ]),
      ),
    );
  }
}
