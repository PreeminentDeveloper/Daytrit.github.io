import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/view/travel_agency/order_details.dart';
import 'package:daytrit/home/view/travel_agency/widget/order_tile.dart';
import 'package:daytrit/home/view/travel_agency/widget/vendor_tile.dart';
import 'package:daytrit/home/view_models/agent_vendor_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TravelOrderScreen extends StatefulWidget {
  const TravelOrderScreen({super.key});

  @override
  State<TravelOrderScreen> createState() => _TravelOrderScreenState();
}

class _TravelOrderScreenState extends State<TravelOrderScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final agentVendorViewModel =
          Provider.of<AgentVendorViewModel>(context, listen: false);
      await agentVendorViewModel.getAgentOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<AgentVendorViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: AppColours.dayTritPrimaryColor,
          title: Text(
            "Orders",
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
        body: order.loading
            ? Loader()
            :
            // order.orderDataResponse!.data.data.isEmpty
            //     ? Center(child: Text("No Order"))
            //     :
            SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height -
                            (kToolbarHeight + kBottomNavigationBarHeight) -
                            15,
                        child: ListView.builder(
                            itemCount:
                                order.orderDataResponse!.data.data.length,
                            itemBuilder: (context, index) {
                              var data =
                                  order.orderDataResponse!.data.data[index];
                              print(order.orderDataResponse!.data.data.length);
                              return OrderTile(
                                  image:
                                      "https://daytrit.net${data!.vendor.photo}",
                                  title: data.vendor.title,
                                  description: data.vendor.description,
                                  price:
                                      "N${data.vendor.cashPrice ?? data.vendor.coinPrice ?? "0.00"}");
                            }),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
