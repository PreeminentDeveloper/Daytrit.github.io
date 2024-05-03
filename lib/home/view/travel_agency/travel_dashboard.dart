import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_order_model.dart';
import 'package:daytrit/home/view/travel_agency/travel_profile.dart';
import 'package:daytrit/home/view/travel_agency/widget/order_tile.dart';
import 'package:daytrit/home/view/travel_agency/widget/vendor_tile.dart';
import 'package:daytrit/home/view_models/agent_vendor_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class TravelDashboardScreen extends StatefulWidget {
  const TravelDashboardScreen({super.key});

  @override
  State<TravelDashboardScreen> createState() => _TravelDashboardScreenState();
}

class _TravelDashboardScreenState extends State<TravelDashboardScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  dynamic orderData;

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final profileModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      await profileModel.getUserProfile();
      final agentVendorViewModel =
          Provider.of<AgentVendorViewModel>(context, listen: false);
      await agentVendorViewModel.getAgentOrders();
    });
  }

  int touchedIndex = -1;
  String? _selectedDate;
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<AgentVendorViewModel>(context);
    return Scaffold(
      drawer: TravelProfileScreen(),
      backgroundColor: AppColours.gray50,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColours.black),
          title: Text(
            "Dashboard",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: 18,
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.bold,
            ),
          )),
      body: ModalProgressHUD(
        inAsyncCall: order.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Container(
            // height: height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(15),
                Card(
                  child: Container(
                    // padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColours.monochromeWhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: getText(
                              context: context,
                              title: 'Total Orders',
                              weight: FontWeight.bold,
                              color: AppColours.officialColor,
                              fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            isDense: true,
                            buttonPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            hint: Text(
                              DateFormat("MMM dd").format(DateTime.now()),
                              // "",
                              style: TextStyle(
                                  fontSize: 18,
                                  // color: AppColours.darkLemon2,
                                  fontFamily: AppConstants.aeonik,
                                  fontWeight: FontWeight.w400),
                            ),
                            items: order.orderDataResponse?.data.data
                                .map((item) => DropdownMenuItem<String>(
                                      value: DateFormat("MMM dd")
                                          .format(item.vendor.createdAt),
                                      child: getText(
                                          context: context,
                                          title: DateFormat("MMM dd")
                                              .format(item.vendor.createdAt),
                                          fontSize: 16),
                                    ))
                                .toList(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                            ),
                            value: _selectedDate,
                            onChanged: (dynamic value) {
                              setState(() {
                                _selectedDate = value;
                                print(_selectedDate);
                              });
                            },
                          )),
                        ),
                        // order.orderDataResponse!.data.data.isEmpty
                        //     ? Center(child: Text("No Order"))
                        //     :
                        SingleChildScrollView(
                          child: Column(
                            children: const [
                              // SizedBox(
                              //   height: height -
                              //       (kToolbarHeight +
                              //           kBottomNavigationBarHeight) -
                              //       500,
                              //   child: ListView.builder(
                              //       itemCount: order.orderDataResponse
                              //               ?.data.data.length ??
                              //           0,
                              //       itemBuilder: (context, index) {
                              //         // var data = order.orderDataResponse
                              //         //     ?.data.data[index];
                              //         return Column(
                              //           children: const [
                              //             Row(
                              //               children: [
                              //                 Icon(Icons
                              //                     .keyboard_arrow_down_rounded)
                              //               ],
                              //             ),
                              //             SizedBox(height: 8),
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment
                              //                       .spaceBetween,
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 StartEndDate(),
                              //                 Stack(
                              //                   children: [
                              //                     OrderStatus(),
                              //                     Positioned(
                              //                         left: 90,
                              //                         top: 92,
                              //                         child: getText(
                              //                             context:
                              //                                 context,
                              //                             title: '50',
                              //                             weight:
                              //                                 FontWeight
                              //                                     .bold,
                              //                             color:
                              //                                 AppColours
                              //                                     .black,
                              //                             fontSize: 30))
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         );
                              //       }),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(20),
                Card(
                  child: Container(
                    // height: height,
                    // height: 300,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColours.monochromeWhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                                context: context,
                                title: 'Latest Booking',
                                weight: FontWeight.bold,
                                color: AppColours.officialColor,
                                fontSize: 18),
                            SvgPicture.asset(
                              'assets/svgs/vert.svg',
                              color: AppColours.officialColor,
                              height: 3,
                              width: 3,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        // order.orderDataResponse!.data.data.isEmpty
                        //     ? Center(child: Text("No Order"))
                        //     :
                        Column(
                          children: [
                            SizedBox(
                              height: height -
                                  (kToolbarHeight +
                                      kBottomNavigationBarHeight) -
                                  370,
                              // height: height,
                              child: ListView.builder(
                                  itemCount: order.orderDataResponse?.data.data
                                              .length ==
                                          1
                                      ? 1
                                      : order.orderDataResponse?.data.data
                                              .reversed
                                              .take(2)
                                              .toList()
                                              .length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    var data = order
                                        .orderDataResponse?.data.data.reversed
                                        .toList()[index];
                                    return Column(
                                      children: [
                                        // StartEndDate2(data: data),
                                        OrderTile(
                                            image:
                                                "https://daytrit.net${data?.vendor.photo}",
                                            title: data?.vendor.title,
                                            description: DateFormat("MMM dd")
                                                .format(data!.vendor.createdAt),
                                            price:
                                                "N${data.vendor.cashPrice ?? data.vendor.coinPrice ?? "0.00"}"),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColours.lemon1,
            value: 25,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColours.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColours.red4,
            value: 50,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColours.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColours.bluegray500,
            value: 25,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColours.black,
              shadows: shadows,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}

class StartEndDate2 extends StatelessWidget {
  const StartEndDate2({
    super.key,
    required this.data,
  });

  final Datum? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            getText(
                context: context,
                title: DateFormat("MMM yyyy").format(data!.vendor.createdAt),
                weight: FontWeight.w600,
                fontSize: 10),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColours.grey800,
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    children: [
                      getText(
                          context: context,
                          title: '04.05.2023',
                          weight: FontWeight.w600,
                          fontSize: 8,
                          color: AppColours.bluegray700A2),
                      addHorizontalSpace(10),
                      SvgPicture.asset(
                        'assets/svgs/date.svg',
                        color: AppColours.bluegray700A2,
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColours.grey800,
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    children: [
                      getText(
                          context: context,
                          title: '05.05.2023',
                          weight: FontWeight.w600,
                          fontSize: 8,
                          color: AppColours.bluegray700A2),
                      addHorizontalSpace(8),
                      SvgPicture.asset(
                        'assets/svgs/date.svg',
                        color: AppColours.bluegray700A2,
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Indicator(
              color: Colors.green,
              text: 'Completed',
              size: 7,
              isSquare: true,
            ),
            addVerticalSpace(20),
            Indicator(
              color: Colors.yellow,
              text: 'Pending',
              size: 7,
              isSquare: true,
            ),
            addVerticalSpace(20),
            Indicator(
              color: Colors.red,
              text: 'Cancelled',
              size: 7,
              isSquare: true,
            ),
          ],
        ),
      ],
    );
  }
}

class StartEndDate extends StatelessWidget {
  const StartEndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColours.grey800,
              borderRadius: BorderRadius.circular(3)),
          child: Row(
            children: [
              getText(
                  context: context,
                  title: '04.05.2023',
                  weight: FontWeight.w600,
                  fontSize: 8,
                  color: AppColours.bluegray700A2),
              addHorizontalSpace(10),
              SvgPicture.asset(
                'assets/svgs/date.svg',
                color: AppColours.bluegray700A2,
                height: 10,
                width: 10,
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColours.grey800,
              borderRadius: BorderRadius.circular(3)),
          child: Row(
            children: [
              getText(
                  context: context,
                  title: '05.05.2023',
                  weight: FontWeight.w600,
                  fontSize: 8,
                  color: AppColours.bluegray700A2),
              addHorizontalSpace(8),
              SvgPicture.asset(
                'assets/svgs/date.svg',
                color: AppColours.bluegray700A2,
                height: 10,
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            color: AppColours.bluegray700A2,
          ),
        )
      ],
    );
  }
}

class RevenueModel {
  String year;
  int financial;
  final charts.Color color;

  RevenueModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}
