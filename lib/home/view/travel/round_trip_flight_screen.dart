import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundTripFlightScreen extends StatelessWidget {
  const RoundTripFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: 500,
      width: double.infinity,
      child: Column(
        children: [
          
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(
                      context: context,
                      title: 'From',
                      weight: FontWeight.w700,
                      fontSize: 13,
                      color: AppColours.gray700),
                  addVerticalSpace(10),
                  getText(
                      context: context,
                      title: 'Lagos',
                      weight: FontWeight.w800,
                      fontSize: 18,
                      color: AppColours.dayTritPrimaryColor),
                  addVerticalSpace(10),
                  getText(
                      context: context,
                      title: '(LOS)',
                      weight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColours.dayTritPrimaryColor),
                ],
              ),
              SvgPicture.asset('assets/svgs/flight.svg'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getText(
                      context: context,
                      title: 'To',
                      weight: FontWeight.w700,
                      fontSize: 13,
                      color: AppColours.gray700),
                  addVerticalSpace(10),
                  getText(
                      context: context,
                      title: 'London',
                      weight: FontWeight.w800,
                      fontSize: 20,
                      color: AppColours.dayTritPrimaryColor),
                  addVerticalSpace(10),
                  getText(
                      context: context,
                      title: '(LHR)',
                      weight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColours.dayTritPrimaryColor),
                ],
              ),
            ],
          ),
          addVerticalSpace(30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getText(
                      context: context,
                      title: 'Depart',
                      weight: FontWeight.w700,
                      fontSize: 13,
                      color: AppColours.gray700),
                        getText(
                      context: context,
                      title: 'Return',
                      weight: FontWeight.w700,
                      fontSize: 13,
                      color: AppColours.gray700),
                ],
              ),
              addVerticalSpace(15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/flight.svg',
                        width: 20,
                      ),
                      addHorizontalSpace(7),
                      getText(
                          context: context,
                          title: '26/06/23',
                          weight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColours.black),
                    ],
                  ),
                    Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/flight.svg',
                        width: 20,
                      ),
                      addHorizontalSpace(7),
                      getText(
                          context: context,
                          title: '26/06/23',
                          weight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColours.black),
                    ],
                  ),
                ],
              ),
              addVerticalSpace(32),
              getText(
                  context: context,
                  title: 'Passenger & Luggage',
                 weight: FontWeight.w700,
                  fontSize: 13,
                  color: AppColours.gray700),
              addVerticalSpace(15),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/flight.svg',
                    width: 20,
                  ),
                  addHorizontalSpace(5),
                  Text(
                    '4',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColours.black),
                  ),
                  addHorizontalSpace(20),
                  SvgPicture.asset(
                    'assets/svgs/flight.svg',
                    width: 20,
                  ),
                  addHorizontalSpace(5),
                  getText(
                    context: context,
                    title: 'Kids',
                    weight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColours.black,
                  ),
                  addHorizontalSpace(20),
                  SvgPicture.asset(
                    'assets/svgs/flight.svg',
                    width: 20,
                  ),
                  addHorizontalSpace(5),
                  getText(
                    context: context,
                    title: 'Kgs',
                    weight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColours.black,
                  ),
                ],
              ),
              addVerticalSpace(30),
              getText(
                context: context,
                title: 'Class',
               weight: FontWeight.w700,
                  fontSize: 13,
                  color: AppColours.gray700,
              ),
              addVerticalSpace(15),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/flight.svg',
                    width: 20,
                  ),
                  addHorizontalSpace(5),
                  getText(
                    context: context,
                    title: 'Economy',
                    weight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColours.black,
                  ),
                  addHorizontalSpace(20),
                  SvgPicture.asset(
                    'assets/svgs/flight.svg',
                    width: 20,
                  ),
                  addHorizontalSpace(5),
                  getText(
                    context: context,
                    title: 'Business',
                    weight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColours.black,
                  ),
                  addHorizontalSpace(20),
                  SvgPicture.asset(
                    'assets/svgs/flight.svg',
                    width: 20,
                  ),
                  addHorizontalSpace(5),
                  getText(
                    context: context,
                    title: 'First Class',
                    weight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColours.black,
                  ),
                ],
              )
            ],
          ),
          addVerticalSpace(60),
          CustomButton(
              buttonName: "Search Flights",
              buttonTextColor: AppColours.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              height: 52,
              width: double.infinity,
              buttonColor: AppColours.red3,
              onPressed: () {
                openTripScreen(context);
              })
        ],
      ),
    );
  }
}