import 'dart:io';

import 'package:daytrit/authentication/components/screen_properties.dart/sizes.dart';
import 'package:daytrit/home/view/status_screen.dart';
import 'package:daytrit/home/view_models/explore_view_model.dart';
import 'package:daytrit/home/view_models/fetch_coin_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/vendor/view/vendor_screen.dart';
import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:daytrit/vendor/widgets/common_image_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../authentication/components/custom_text/get_text.dart';
import '../../authentication/components/flushbar/custom_flush_bar.dart';
import '../../utils/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  //LoginModel? loginModel;
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CustomFlushBar customFlushBar = CustomFlushBar();

  File? images;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final profileModel =
          Provider.of<ProfileViewModel>(context, listen: false);

      await profileModel.getUserProfile();
      // m.markAllAsRead();

      final fetchCoinModel =
          Provider.of<FetchCoinViewModel>(context, listen: false);
      await fetchCoinModel.getCoin();
      Provider.of<VendorViewModel>(context, listen: false).getAllVendors();
      final fetchExploreModel = await profileModel.getUserProfile();
      Provider.of<ExploreViewModel>(context, listen: false).getExploreData();
    });
  }

  var banners = [AppImages.banner1, AppImages.banner2, AppImages.banner3];
  var fiveTs = ["Treats", "Travels", "Tourism", "Trade"];

  setFiveTsColor(String e) {
    switch (e) {
      case "Treats":
        {
          return AppColours.dayTritPrimaryColor4;
        }
      case "Travels":
        {
          return AppColours.dayTritPrimaryColor3;
        }
      case "Tourism":
        {
          return AppColours.dayTritPrimaryColor2;
        }
      case "Trade":
        {
          return AppColours.dayTritPrimaryColor;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileViewModel>(context);
    final fetchCoinViewModel = Provider.of<FetchCoinViewModel>(context);
    final vendors = Provider.of<VendorViewModel>(context).vendors;
    final pv = Provider.of<VendorViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              AppImages.dayTritOfficialLogoNameBlack))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              try {
                                final image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (image == null) return;
                                final imageTemp = File(image.path);

                                setState(() {
                                  images = imageTemp;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StatusScreen(
                                              image: imageTemp,
                                            )));
                              } on PlatformException catch (e) {
                                print('Failed to pick image: $e');
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 60.59,
                              height: 60.59,
                              decoration: BoxDecoration(
                                color: AppColours.black,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppColours.grey,
                                size: 30,
                              ),
                            ),
                          ),
                          getText(
                              context: context,
                              title: 'Your Trit',
                              fontSize: 13,
                              color: AppColours.black,
                              weight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                        children: List.generate(
                            stats.length,
                            (index) => Status(
                                  image: stats[index].image,
                                  name: stats[index].name,
                                )))
                    //  SizedBox(
                    //   height: 80,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ListView.builder(
                    //     //    physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount:
                    //     itemBuilder: (context, index) {
                    //       return Status(
                    //         image: stats[index].image,
                    //         name: stats[index].name,
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        child: getText(
                            context: context,
                            title:
                                'Hello ${profileModel.userData?.name ?? ""}!',
                            fontSize: 20,
                            color: AppColours.black,
                            weight: FontWeight.w500),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColours.lemon2),
                            color: AppColours.lemon3,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        height: 32.01,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppImages.coin,
                                width: 15,
                                height: 15,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              getText(
                                  context: context,
                                  title: '${fetchCoinViewModel.coinData ?? ""}',
                                  fontSize: 16,
                                  color: AppColours.black,
                                  weight: FontWeight.w700),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: banners
                        .map((e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: GestureDetector(
                                onTap: () async {
                                  if (e.contains("banner1")) {
                                    print("travel now");
                                    customFlushBar.showSuccessFlushBar(
                                        title: 'Notification!',
                                        body:
                                            "Feature not available on this version",
                                        context: context);
                                  } else if (e.contains("banner2")) {
                                    print("trit coins");
                                    const urlPreview =
                                        "https://daytrit.com/#download";
                                    await Share.share(
                                        "Experience thrilling adventures and enjoy abundant rewards with the DayTrit app! By using my referral link, you'll earn a whopping 500 trit coins when you download the app and create an account. Start your journey now! \n\n$urlPreview\n\nMy Referral code is ${profileModel.uData!.referralCode}");
                                  } else {
                                    print("discounted local & intl treats");
                                    customFlushBar.showSuccessFlushBar(
                                        title: 'Notification!',
                                        body:
                                            "Feature not available on this version",
                                        context: context);
                                  }
                                },
                                child: SizedBox(
                                  width: width(context) - 60,
                                  child: Image(
                                      image: AssetImage(e), fit: BoxFit.cover),
                                ))))
                        .toList()),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: fiveTs
                          .map((e) => Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: GestureDetector(
                                onTap: () {
                                  if (e.contains("Treat")) {
                                    print("T for Treat");
                                  } else if (e.contains("Travel")) {
                                    print("T for Travel");
                                  } else if (e.contains("Tourism")) {
                                    print("T for Tourism");
                                  } else {
                                    print("T for Trade");
                                  }
                                  customFlushBar.showSuccessFlushBar(
                                      title: 'Notification!',
                                      body:
                                          "Feature not available on this version",
                                      context: context);
                                },
                                child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 50) /
                                          4,
                                  decoration: BoxDecoration(
                                      color: setFiveTsColor(e),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(child: Text(e)),
                                  ),
                                ),
                              )))
                          .toList()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        getText(
                            context: context,
                            title: "Recommendations",
                            fontSize: 20,
                            color: AppColours.black,
                            weight: FontWeight.w600),
                        Spacer(),
                        InkWell(
                          onTap: () => {},
                          // openvendorContainerNav(context),
                          child: getText(
                              context: context,
                              title: "see all",
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: AppColours.red,
                              weight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    getText(
                        context: context,
                        title: "Some Excitements to explore",
                        fontSize: 14,
                        color: AppColours.grey,
                        weight: FontWeight.w700),
                    if (vendors.isNotEmpty)
                      StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 12),
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          itemCount: vendors.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Provider.of<VendorViewModel>(context,
                                          listen: false)
                                      .selectedVendor = index;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => VendorScreen()));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    child: CommonImageView(
                                        url:
                                            "https://daytrit.net${vendors[index].photo}",
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: const [
                                                  Colors.black,
                                                  Colors.black54,
                                                  Colors.transparent
                                                ])),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: getText(
                                                  context: context,
                                                  title:
                                                      "${vendors[index].title} ",
                                                  fontSize: 15.01,
                                                  color: AppColours.white,
                                                  weight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            getText(
                                                context: context,
                                                title:
                                                    "${vendors[index].country}",
                                                fontSize: 15.01,
                                                color: AppColours.white,
                                                weight: FontWeight.w700),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppImages.star,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                getText(
                                                    context: context,
                                                    title:
                                                        "${vendors[index].rating}",
                                                    fontSize: 15.01,
                                                    color: AppColours.white,
                                                    weight: FontWeight.w700),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ]));
                          },
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.count(
                                2, index.isEven ? 2.5 : 2);
                          }),
                    Center(
                      child: pv.loading
                          ? Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: CircularProgressIndicator(
                                color: AppColours.dayTritPrimaryColor,
                              ),
                            )
                          : IconButton(
                              onPressed: () => pv.getAllVendors(),
                              icon: Icon(Icons.refresh)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final String image;
  final String name;
  final CustomFlushBar customFlushBar = CustomFlushBar();
  Status({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => customFlushBar.showSuccessFlushBar(
            title: 'Notification!',
            body: "Feature not available on this version",
            context: context),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              width: 60.59,
              height: 60.59,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  //fit: BoxFit.cover
                ),
              ),
            ),
            getText(
                context: context,
                title: name,
                fontSize: 13,
                color: AppColours.black,
                weight: FontWeight.w500),
          ],
        ));
  }
}

class StatusModel {
  final String image;
  final String name;

  StatusModel({required this.image, required this.name});
}

List<StatusModel> stats = [
  StatusModel(
    image: AppImages.status1,
    name: "Jesam Titi",
  ),
  StatusModel(
    image: AppImages.status3,
    name: "Patrick O",
  ),
  StatusModel(
    image: AppImages.status4,
    name: "Silver",
  ),
  StatusModel(
    image: AppImages.status3,
    name: "Segun",
  ),
  StatusModel(
    image: AppImages.status4,
    name: "Jessy",
  ),
  StatusModel(
    image: AppImages.status1,
    name: "Chidinma",
  ),
  StatusModel(
    image: AppImages.status4,
    name: "Tobi",
  ),
];
