import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/agent_vendor_model.dart';
import 'package:daytrit/home/repo/fetch_agent_vendor_service.dart';
import 'package:daytrit/home/view/travel_agency/widget/vendor_tile.dart';
import 'package:daytrit/home/view_models/agent_vendor_view_model.dart';
import 'package:daytrit/home/view_models/notification_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TravelVendorScreen extends StatefulWidget {
  const TravelVendorScreen({super.key});

  @override
  State<TravelVendorScreen> createState() => _TravelVendorScreenState();
}

class _TravelVendorScreenState extends State<TravelVendorScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final agentVendorViewModel =
          Provider.of<AgentVendorViewModel>(context, listen: false);
      await agentVendorViewModel.getAgentVendors();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vendor = Provider.of<AgentVendorViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Vendors",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColours.black,
                fontSize: 18,
                fontFamily: 'Aeonik',
                fontWeight: FontWeight.bold,
              ),
            ),
            foregroundColor: AppColours.dayTritPrimaryColor),
        body: vendor.loading
            ? Loader()
            : vendor.agentVendorDataResponse!.data.isEmpty
                ? Center(child: Text("No Vendor"))
                : SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height -
                                (kToolbarHeight + kBottomNavigationBarHeight) -
                                15,
                            child: ListView.builder(
                                itemCount: vendor
                                        .agentVendorDataResponse?.data.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  var data = vendor
                                      .agentVendorDataResponse?.data[index];
                                  return VendorTile(
                                      image:
                                          "https://daytrit.net${data?.photo}",
                                      title: data?.title,
                                      description: data?.description,
                                      rating: data?.rating,
                                      price:
                                          "N${data?.cashPrice ?? data?.coinPrice ?? "0.00"}");
                                }),
                          ),
                          CustomButton(
                            buttonName: "Add New Vendor",
                            buttonTextColor: AppColours.white,
                            height: 52,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            width: double.infinity,
                            buttonColor: AppColours.officialColor,
                            onPressed: () => openAddVendor(context),
                          )
                        ],
                      ),
                    ),
                  ));
  }
}
