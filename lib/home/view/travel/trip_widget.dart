// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daytrit/home/models/dataModel/trip_model.dart';
import 'package:daytrit/home/view/travel/trip_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';

class TripWidget extends StatelessWidget {
  final TripModel tripModel;

  const TripWidget({
    Key? key,
    required this.tripModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColours.white),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Depart',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.black),
                ),
                addVerticalSpace(3),
                getText(
                    context: context,
                    title: tripModel.departureTime,
                    weight: FontWeight.w800,
                    fontSize: 20),
                Text(
                  'Lagos',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.gray500),
                ),
                addVerticalSpace(3),
                Text(
                  '(LOS)',
                  style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.gray500),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SvgPicture.asset('assets/svgs/flight.svg'),
                ),
                addVerticalSpace(20),
                Text(
                  tripModel.stops,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.gray500),
                ),
                addVerticalSpace(3),
                Text(
                  '6 h 30m',
                  style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.gray500),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Return',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.black),
                ),
                addVerticalSpace(5),
                getText(
                    context: context,
                    title: tripModel.returnTime,
                    weight: FontWeight.w800,
                    fontSize: 20),
                // addVerticalSpace(10),
                Text(
                  'London',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.gray500),
                ),
                addVerticalSpace(5),
                Text(
                  '(LHS)',
                  style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColours.gray500),
                )
              ],
            ),
          ],
        ),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                getText(
                    context: context,
                    title: '\$885',
                    weight: FontWeight.w800,
                    fontSize: 20),
                addHorizontalSpace(10),
                Container(
                  width: 65,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColours.red3),
                  child: Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TripSummaryScreen()));
                    },
                    child: getText(
                        context: context,
                        title: 'Book',
                        fontSize: 15,
                        color: AppColours.white),
                  )),
                )
              ],
            ),
            tripModel.viewDetails == true
                ? getText(
                    context: context,
                    title: 'View Details',
                    weight: FontWeight.w600,
                    fontSize: 15,
                  )
                : SizedBox()
          ],
        )
      ]),
    );
  }
}
