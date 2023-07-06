import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/authentication/components/loader/watch_ads_loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/view/watch_ads/ad_helper.dart';
import 'package:daytrit/home/view_models/earn_coin_reward_view_model.dart';
import 'package:daytrit/home/view_models/earn_coin_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

enum AdLoadState { notLoaded, loading, loaded }

class WatchAdsScreen extends StatefulWidget {
  const WatchAdsScreen({Key? key}) : super(key: key);

  @override
  State<WatchAdsScreen> createState() => _WatchAdsScreenState();
}

class _WatchAdsScreenState extends State<WatchAdsScreen> {
  final CustomFlushBar customFlushBar = CustomFlushBar();

  bool isLoading = false;

  //Add _rewardedAd
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    _loadRewardedAd();
    super.initState();
  }

  setLoading(loading) {
    setState(() => isLoading = loading);
  }

  void _loadRewardedAd() {
    setLoading(true);
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
                _rewardedAd = null;
                print("Rewarded AD dismissed setting to null: $_rewardedAd");
              });
              _loadRewardedAd();
            },
          );

          setState(() {
            _rewardedAd = ad;
            print("Rewarded AD loaded: $_rewardedAd");
            isLoading = false;
          });
        },
        onAdFailedToLoad: (err) {
          customFlushBar.showErrorFlushBar(
              title: 'Error occurred',
              body: "Ad failed to load. Kindly check your internet connection.",
              context: context);
        },
      ),
    );
  }

  @override
  void dispose() {
    // Dispose a RewardedAd object
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final earnCoinViewModel = Provider.of<EarnCoinViewModel>(context);
    return ModalProgressHUD(
      inAsyncCall: earnCoinViewModel.loading || isLoading,
      progressIndicator: WatchAdsLoader(),
      child: Scaffold(
        backgroundColor: AppColours.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: 111.81,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              AppImages.dayTritOfficialLogoNameWhite))),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(
                      context: context,
                      title: "Watch Ads",
                      fontSize: 24,
                      color: AppColours.white,
                      weight: FontWeight.w700),
                  addVerticalSpace(20),
                  InkWell(
                    onTap: () async {
                      _rewardedAd == null
                          ? WatchAdsLoader()
                          : _rewardedAd?.show(onUserEarnedReward: (_, reward) {
                        final earnCoinViewModel =
                        Provider.of<EarnCoinRewardViewModel>(context,
                            listen: false);
                        earnCoinViewModel.rewardAd(context);
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 219,
                      color: AppColours.lemon3,
                      child: Image(image: AssetImage(AppImages.playIcon)),
                    ),
                  )
                ],
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}