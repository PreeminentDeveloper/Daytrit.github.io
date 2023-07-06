import 'package:daytrit/authentication/views/onboarding/widgets/onboarding_page.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  _storeOnBoardingInfo() async {
    //is view is set to 1 (user have viewed onboarding)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("onBoarding",1);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage(
                  isLogoVisible: false,
                  image: AppImages.onboardingImage1,
                  title1: "Travel the",
                  title2: "world",
                  subTitle1: "with your",
                  packageType: "FREE ",
                  subTitle2: '"Trit" coins',
                  bottonClick: () => nextPage()),
              OnboardingPage(
                  isLogoVisible: false,
                  image: AppImages.onboardingImage2,
                  title1: "Watch",
                  title2: "Ads",
                  subTitle1: "watch Ads to earn",
                  packageType: "FREE ",
                  subTitle2: '"Trit" coins',
                  bottonClick: () => nextPage()),
              OnboardingPage(
                  isLogoVisible: false,
                  image: AppImages.onboardingImage3,
                  title1: "Travel",
                  title1More: "now, pay",
                  isTitle1MoreVisible: true,
                  title2: "later",
                  subTitle1: "with your",
                  packageType: "PREMIUM ",
                  subTitle2: 'account',
                  bottonName: "Get Started",
                  bottonClick: () async {
                    await _storeOnBoardingInfo();
                    openTermsAndAgreement(context);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
