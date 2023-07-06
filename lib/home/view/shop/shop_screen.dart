import 'package:daytrit/home/models/dataModel/shop_trit_model.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/view/shop/shop_tile_screen.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.gray50,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shop',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                  children: shopTrit
                      .map((e) => ShopTile(
                            shopModel: e,
                          ))
                      .toList()),
              addVerticalSpace(15),
              InkWell(
                onTap: () async {
                  const urlPreview = "https://daytrit.com/#download";
                  await Share.share(
                      "Experience thrilling adventures and enjoy abundant rewards with the DayTrit app! By using my referral link, you'll earn a whopping 500 trit coins when you download the app and create an account. Start your journey now! \n\n$urlPreview\n\nMy Referral code is ${profileModel.uData!.referralCode}");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColours.dayTritPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppImages.coinIcon),
                          )),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      getText(
                          context: context,
                          title: 'Refer & earn\n50 Trit coins',
                          textAlign: TextAlign.center,
                          fontSize: 20,
                          weight: FontWeight.w600),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
