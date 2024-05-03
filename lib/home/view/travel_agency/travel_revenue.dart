import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/view_models/agent_vendor_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class TravelRevenueScreen extends StatefulWidget {
  const TravelRevenueScreen({super.key});

  @override
  State<TravelRevenueScreen> createState() => _TravelRevenueScreenState();
}

class _TravelRevenueScreenState extends State<TravelRevenueScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final agentVendorViewModel =
          Provider.of<AgentVendorViewModel>(context, listen: false);
      await agentVendorViewModel.getAgentRevenue();
    });
  }

  @override
  Widget build(BuildContext context) {
    final revenue = Provider.of<AgentVendorViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColours.dayTritPrimaryColor,
        title: Text(
          "Revenue",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColours.black,
            fontSize: getFontSize(
              25,
            ),
            fontFamily: 'Aeonik',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: revenue.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                addVerticalSpace(10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: AppColours.dayTritPrimaryColor, width: 1.5)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(
                            context: context,
                            title: "Total Earnings",
                            fontSize: 20),
                        addVerticalSpace(20),
                        getText(
                            context: context,
                            title:
                                "N${revenue.revenueDataResponse?.data.totalAmount ?? "0.00"}",
                            fontSize: 40,
                            color: AppColours.dayTritPrimaryColor,
                            weight: FontWeight.bold),
                        addVerticalSpace(10),
                        Divider(
                          color: AppColours.dayTritPrimaryColor,
                        ),
                        addVerticalSpace(10),
                        getText(
                            context: context,
                            title:
                                "Earnings in ${revenue.revenueDataResponse?.data.lastMonthName ?? ""}",
                            fontSize: 20),
                        addVerticalSpace(20),
                        getText(
                            context: context,
                            title:
                                "N${revenue.revenueDataResponse?.data.lastMonthEarning ?? "0.00"}",
                            fontSize: 40,
                            color: AppColours.dayTritPrimaryColor,
                            weight: FontWeight.bold)
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
