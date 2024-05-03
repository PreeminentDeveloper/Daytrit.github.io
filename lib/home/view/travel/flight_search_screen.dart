import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/view/travel/one_way_flight_screen.dart';
import 'package:daytrit/home/view/travel/round_trip_flight_screen.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';

import 'package:flutter/material.dart';

class FlightSearch extends StatefulWidget {
  const FlightSearch({super.key});

  @override
  State<FlightSearch> createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.dayTritPrimaryColor,
      appBar: AppBar(
          backgroundColor: AppColours.dayTritPrimaryColor,
          elevation: 0,
          title: Text(
            'Find a flight',
            style: TextStyle(
              color: AppColours.white,
              fontSize: getFontSize(
                32,
              ),
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(140),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Text(
                        'One-Way',
                        style: TextStyle(
                            fontWeight: selectedIndex == 0
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: 20,
                            color: AppColours.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Text(
                        'Round Trip',
                        style: TextStyle(
                            fontWeight: selectedIndex == 1
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: 20,
                            color: AppColours.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            addVerticalSpace(30),
            selectedIndex == 0 ? OneWayFlightScreen() : RoundTripFlightScreen()
          ],
        ),
      ),
    );
  }
}
