import 'dart:io';
import 'package:daytrit/authentication/components/screen_properties.dart/sizes.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/all_status_model.dart';
import 'package:daytrit/home/view/status/all_status_view_page.dart';
import 'package:daytrit/home/view/status/status_page_view.dart';
import 'package:daytrit/home/view/status/status_selection_screen.dart';
import 'package:daytrit/home/view/travel/flight_search_screen.dart';
import 'package:daytrit/home/view_models/explore_view_model.dart';
import 'package:daytrit/home/view_models/fetch_coin_view_model.dart';
import 'package:daytrit/home/view_models/status_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/vendor/view/vendor_screen.dart';
import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:daytrit/vendor/widgets/common_image_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:status_view/status_view.dart';
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
      // final statusModel = Provider.of<StatusViewModel>(context, listen: false);
      await profileModel.getUserProfile();
      // await statusModel.getUserStatus();
      // await statusModel.getAllStatus();
      // m.markAllAsRead();

      final fetchCoinModel =
          Provider.of<FetchCoinViewModel>(context, listen: false);
      await fetchCoinModel.getCoin();
      Provider.of<VendorViewModel>(context, listen: false).getAllVendors();
      Provider.of<ExploreViewModel>(context, listen: false).getExploreData();
    });
  }

  var banners = [AppImages.banner1, AppImages.banner2, AppImages.banner3];
  var fiveTs = ["Treats", "Travels", "Tourism"];

  String isSelected = "";

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

  setSelectedChip(String? e) {
    if (e == "Treats") setState(() => isSelected = "Treats");
    if (e == "Travels") setState(() => isSelected = "Travels");
    if (e == "Tourism") setState(() => isSelected = "Tourism");
    if (e == "Trade") setState(() => isSelected = "Trade");
  }

  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileViewModel>(context);
    final fetchCoinViewModel = Provider.of<FetchCoinViewModel>(context);
    final vendors = Provider.of<VendorViewModel>(context).vendors;
    final pv = Provider.of<VendorViewModel>(context);
    final statusses = Provider.of<StatusViewModel>(context);
    return Scaffold(
      body: RefreshIndicator(
        color: AppColours.dayTritPrimaryColor,
        onRefresh: () async {
          initialize();
        },
        child: SingleChildScrollView(
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
                // SizedBox(
                //   height: 100,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 12),
                //         child: Column(
                //           children: [
                //             InkWell(
                //               onTap: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) =>
                //                             StatusSelectionScreen()));
                //               },
                //               child: Container(
                //                 margin: EdgeInsets.only(right: 5),
                //                 width: 60.59,
                //                 height: 60.59,
                //                 decoration: BoxDecoration(
                //                   color: AppColours.black,
                //                   shape: BoxShape.circle,
                //                 ),
                //                 child: Icon(
                //                   Icons.add,
                //                   color: AppColours.grey,
                //                   size: 30,
                //                 ),
                //               ),
                //             ),
                //             addVerticalSpace(5),
                //             Expanded(
                //               child: getText(
                //                   context: context,
                //                   title: 'Your Trit',
                //                   fontSize: 13,
                //                   color: AppColours.black,
                //                   weight: FontWeight.w500),
                //             ),
                //           ],
                //         ),
                //       ),
                //       statusses.status.isEmpty
                //           ? SizedBox()
                //           : addHorizontalSpace(5),
                //       statusses.status.isEmpty
                //           ? SizedBox()
                //           : Column(
                //               children: [
                //                 InkWell(
                //                   onTap: () {
                //                     Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) =>
                //                                 StatusPageView(
                //                                     statusModel:
                //                                         statusses.status)));
                //                   },
                //                   child: StatusView(
                //                     radius: 30,
                //                     spacing: 15,
                //                     strokeWidth: 2,
                //                     indexOfSeenStatus: 2,
                //                     numberOfStatus: statusses.status.length,
                //                     padding: 4,
                //                     seenColor: Colors.grey,
                //                     unSeenColor: AppColours.dayTritPrimaryColor,
                //                     centerImageUrl:
                //                         "https://daytrit.net${statusses.status.first.fileUrl}",
                //                   ),
                //                 ),
                //                 addVerticalSpace(5),
                //                 getText(
                //                     context: context,
                //                     title: 'Me',
                //                     fontSize: 13,
                //                     color: AppColours.black,
                //                     weight: FontWeight.w500),
                //               ],
                //             ),
                //       statusses.status.isEmpty
                //           ? SizedBox()
                //           : addHorizontalSpace(5),
                //       Row(
                //           children: List.generate(
                //         statusses.allStatus.length,
                //         (index) {
                //           print(' length ${statusses.allStatus.length}');
                //           return InkWell(
                //             onTap: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) => AllStatusPageView(
                //                           statusModel:
                //                               statusses.allStatus[index])));
                //             },
                //             child: Status(
                //               statusModel: statusses.allStatus[index],
                //             ),
                //           );
                //         },
                //       ))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
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
                      InkWell(
                        splashColor: AppColours.lightLemon2,
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () => openWalletScreen(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColours.lemon2),
                              color: AppColours.lemon3,
                              borderRadius: BorderRadius.circular(20)),
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
                                    title:
                                        '${fetchCoinViewModel.coinData ?? ""}',
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
                                      customFlushBar.showSuccessFlushBar(
                                          title: 'Notification!',
                                          body:
                                              "Feature not available on this version",
                                          context: context);
                                    } else if (e.contains("banner2")) {
                                      const urlPreview =
                                          "https://daytrit.com/#download";
                                      await Share.share(
                                          "Experience thrilling adventures and enjoy abundant rewards with the DayTrit app! By using my referral link, you'll earn a whopping 500 trit coins when you download the app and create an account. Start your journey now! \n\n$urlPreview\n\nMy Referral code is ${profileModel.uData!.referralCode}");
                                    } else {
                                      customFlushBar.showSuccessFlushBar(
                                          title: 'Coming soon!',
                                          body:
                                              "Feature not available on this version",
                                          context: context);
                                    }
                                  },
                                  child: SizedBox(
                                    width: width(context) - 60,
                                    child: Image(
                                        image: AssetImage(e),
                                        fit: BoxFit.cover),
                                  ))))
                          .toList()),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: fiveTs
                                .map((e) => InkWell(
                                      splashColor: setFiveTsColor(e),
                                      borderRadius: BorderRadius.circular(25.0),
                                      onTap: () {
                                        setSelectedChip(e);
                                        if (e.contains("Treat")) {
                                          setState(() {
                                            pv.getAllVendors(entry: "treats");
                                          });
                                        } else if (e.contains("Travel")) {
                                          setState(() {
                                            pv.getAllVendors(entry: "travels");
                                          });
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             FlightSearch()));
                                          // customFlushBar.showSuccessFlushBar(
                                          //     title: 'Notification!',
                                          //     body:
                                          //         "Feature not available on this version",
                                          //     context: context);
                                        } else if (e.contains("Tourism")) {
                                          pv.getAllVendors(entry: "tourism");
                                        } else {
                                          customFlushBar.showSuccessFlushBar(
                                              title: 'Notification!',
                                              body:
                                                  "Feature not available on this version",
                                              context: context);
                                        }
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: AppColours.lightLemon2
                                                // setSelectedColor(e)
                                                )),
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  50) /
                                              4,
                                          decoration: BoxDecoration(
                                              color: setFiveTsColor(e),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                                child: Text(
                                              e,
                                              style: TextStyle(
                                                  fontWeight: isSelected == e
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                    ),
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
                      getText(
                          context: context,
                          title: "Recommendations",
                          fontSize: 20,
                          color: AppColours.black,
                          weight: FontWeight.w600),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VendorScreen()));
                                  },
                                  child: Stack(children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      child: CommonImageView(
                                          url:
                                              "https://daytrit.net${vendors[index].photo}",
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
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
                                onPressed: () {
                                  pv.getAllVendors();
                                  isSelected = "";
                                },
                                icon: Icon(Icons.refresh)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final AllStatusModel statusModel;
  final CustomFlushBar customFlushBar = CustomFlushBar();
  Status({
    Key? key,
    required this.statusModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // StatusView(
        //   radius: 30,
        //   spacing: 15,
        //   strokeWidth: 2,
        //   indexOfSeenStatus: 2,
        //   numberOfStatus: statusModel.statuses!.length,
        //   padding: 4,
        //   seenColor: Colors.grey,
        //   unSeenColor: Colors.red,
        //   centerImageUrl:
        //       "https://daytrit.net${statusModel.statuses!.first.fileUrl}",
        // ),
        addVerticalSpace(5),
        Expanded(
          child: SizedBox(
            width: 70,
            child: getText(
                context: context,
                textAlign: TextAlign.center,
                title: statusModel.name.toString().replaceAll(" ", "\n") ?? '',
                fontSize: 13,
                color: AppColours.black,
                textOverflow: TextOverflow.ellipsis,
                weight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
