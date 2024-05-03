import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/trip_model.dart';
import 'package:daytrit/home/view/travel/trip_widget.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  var date = ["Sun 25", "Mon 26", "Tues 27", "Weds 28", ' Thurs 29', 'Fri 30'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          addVerticalSpace(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        getText(
                            context: context,
                            title: 'Lagos-London',
                            fontSize: 15,
                            weight: FontWeight.w600),
                        addHorizontalSpace(5),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColours.black),
                        ),
                        addHorizontalSpace(5),
                        getText(
                            context: context,
                            title: 'ONE-WAY',
                            fontSize: 15,
                            weight: FontWeight.w600,
                            color: AppColours.dayTritPrimaryColor)
                      ],
                    ),
                    addVerticalSpace(5),
                    Row(
                      children: [
                        getText(
                            context: context,
                            title: '25 Jun|',
                            fontSize: 15,
                            weight: FontWeight.w600,
                            color: AppColours.gray500),
                        addHorizontalSpace(3),
                        getText(
                            context: context,
                            title: '1 Traveler|',
                            fontSize: 15,
                            weight: FontWeight.w600,
                            color: AppColours.gray500),
                        addHorizontalSpace(3),
                        getText(
                            context: context,
                            title: 'Economy',
                            fontSize: 15,
                            weight: FontWeight.w600,
                            color: AppColours.gray500)
                      ],
                    )
                  ],
                ),
                SvgPicture.asset('assets/svgs/trip.svg')
              ],
            ),
          ),
          addVerticalSpace(20),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColours.dayTritPrimaryColor,
                          ),
                          child: Center(
                            child: getText(
                                context: context,
                                title: 'JUNE',
                                color: AppColours.white,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      addHorizontalSpace(10),
                      Row(
                          children: date
                              .map((e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: selectedIndex == 1
                                              ? AppColours.dayTritPrimaryColor
                                              : AppColours.nudeGrey,
                                          border: Border.all(
                                              color: AppColours.grey400)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          getText(
                                              context: context,
                                              title: e,
                                              fontSize: 17,
                                              weight: FontWeight.w600,
                                              color: AppColours.gray500),
                                          getText(
                                              context: context,
                                              title: '#660,556',
                                              fontSize: 17,
                                              weight: FontWeight.w600,
                                              color: AppColours.black)
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList())
                    ],
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColours.dayTritPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 650,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        getText(
                            context: context,
                            title: 'Sort by:',
                            fontSize: 15,
                            weight: FontWeight.w700,
                            color: AppColours.white),
                        addHorizontalSpace(20),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(0.6)),
                          width: 100,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  getText(
                                      context: context,
                                      title: 'Price',
                                      fontSize: 15,
                                      weight: FontWeight.w600,
                                      color: AppColours.white),
                                  Icon(
                                    Icons.arrow_downward,
                                    color: AppColours.white,
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.6)),
                        child: SvgPicture.asset(
                          'assets/svgs/flight.svg',
                          width: 20,
                          color: AppColours.white,
                        ))
                  ],
                ),
                addVerticalSpace(5),
                getText(
                    context: context,
                    title: '20 flights available Lagos to London',
                    fontSize: 15,
                    weight: FontWeight.w600,
                    color: AppColours.white),
                addVerticalSpace(5),
                Column(
                    children: trips
                        .map((e) => TripWidget(
                              tripModel: e,
                            ))
                        .toList())
              ],
            ),
          )
        ]),
      ),
    );
  }
}
