import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/components/custom_list_tile/customlist_tile.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TravelProfileScreen extends StatelessWidget {
  const TravelProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileViewModel>(context);
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
              decoration: BoxDecoration(color: AppColours.officialColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage(AppImages.dayTritWhiteLogo)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(profileModel.userData?.name ?? "",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Text(profileModel.userData?.email ?? "",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            // addVerticalSpace(40),
            CustomListTile(
              textColor: AppColours.grey900,
              onTap: () {
                openTravelDashboard(context);
              },
              leading: SvgPicture.asset('assets/svgs/dashboard.svg'),
              title: 'Dashboard',
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColours.grey900,
                    size: 15,
                  )),
            ),
            CustomListTile(
                onTap: () {
                  openMyVendor(context);
                },
                textColor: AppColours.grey900,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColours.grey900,
                      size: 15,
                    )),
                leading: SvgPicture.asset('assets/svgs/vendor.svg'),
                title: 'My Vendors'),
            CustomListTile(
                onTap: () {
                  openAddVendor(context);
                },
                leading: SvgPicture.asset('assets/svgs/add_vendor.svg'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColours.grey900,
                      size: 15,
                    )),
                textColor: AppColours.grey900,
                title: 'Add Vendor'),
            CustomListTile(
                onTap: () {
                  openOrder(context);
                },
                textColor: AppColours.grey900,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColours.grey900,
                      size: 15,
                    )),
                leading: SvgPicture.asset('assets/svgs/order.svg'),
                title: 'Orders'),
            CustomListTile(
                onTap: () {
                  openRevenue(context);
                },
                textColor: AppColours.grey900,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColours.grey900,
                      size: 15,
                    )),
                leading: SvgPicture.asset('assets/svgs/revenue.svg'),
                title: 'Revenue'),

            Expanded(
              child: Stack(
                children: [
                  Positioned(left: 1, child: Divider()),
                  Positioned(
                    // left: 0,
                    bottom: 0,
                    child: TextButton.icon(
                      onPressed: () async {
                        var data = await profileModel.logOut();
                        if (data == true) {
                          openLogOut(context);
                        }
                      },
                      icon: SvgPicture.asset(
                        AppImages.logout,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      label: getText(
                          context: context,
                          title: "Log out",
                          fontSize: 14,
                          color: AppColours.red,
                          weight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
