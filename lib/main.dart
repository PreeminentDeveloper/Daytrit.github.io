import 'package:daytrit/authentication/view_models/edit_profile_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/forgot_password_view_model.dart';
import 'package:daytrit/authentication/view_models/login_view_model.dart';
import 'package:daytrit/authentication/view_models/login_with_google_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/register_view_model.dart';
import 'package:daytrit/authentication/view_models/validation_model.dart';
import 'package:daytrit/authentication/view_models/verify_email_view_model.dart';
import 'package:daytrit/authentication/views/login_screen.dart';
import 'package:daytrit/authentication/views/onboarding/screens/onboarding_screen.dart';
import 'package:daytrit/home/components/bottom_nav_bar/bottom_nav.dart';
import 'package:daytrit/home/view_models/delete_account_view_model.dart';
import 'package:daytrit/home/view_models/delete_user_account_view_model.dart';
import 'package:daytrit/home/view_models/earn_coin_reward_view_model.dart';
import 'package:daytrit/home/view_models/earn_coin_view_model.dart';
import 'package:daytrit/home/view_models/explore_view_model.dart';
import 'package:daytrit/home/view_models/fetch_coin_view_model.dart';
import 'package:daytrit/home/view_models/notification_view_model.dart';
import 'package:daytrit/home/view_models/purchase_coin_viewmodel.dart';
import 'package:daytrit/home/view_models/purchase_trit_coin_viewmodel.dart';
import 'package:daytrit/home/view_models/search_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/services/auth_service.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/vendor/view/view_models/vendor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'authentication/view_models/new_password_view_model.dart';
import 'home/view_models/home_view_model.dart';

void main() async {
  //making out changes
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //when a user has onboarded that is  1
  AuthService.isOnBoarded = prefs.getInt("onBoarding") ?? 0;
  final bool isLoggedIn = await AuthService.getLoggedInUser();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => VerifyEmailViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => NewPasswordViewModel()),
        // ChangeNotifierProvider(create: (_) => LoginWithFacebookViewModel()),
        ChangeNotifierProvider(create: (_) => LoginWithGoogleViewModel()),
        ChangeNotifierProvider(create: (_) => ValidationModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => EarnCoinViewModel()),
        ChangeNotifierProvider(create: (_) => EarnCoinRewardViewModel()),
        ChangeNotifierProvider(create: (_) => FetchCoinViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => DeleteUserAccountViewModel()),
        ChangeNotifierProvider(create: (_) => DeleteAccountViewModel()),
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
        ChangeNotifierProvider(create: (_) => ExploreViewModel()),
        ChangeNotifierProvider(create: (_) => VendorViewModel()),
        ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
        ChangeNotifierProvider(create: (_) => NotificationViewModel()),
        ChangeNotifierProvider(create: (_) => PurchaseCoinViewModel()),
        ChangeNotifierProvider(create: (_) => PurchaseTritCoinViewModel()),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'DayTrit',
            theme: ThemeData(
              fontFamily: 'Aeonik',
              primaryColor: AppColours.dayTritBlue,
              textTheme: ThemeData.light().textTheme,
            ),
            // home: SplashScreen(isLoggedIn: isLoggedIn)),
            home: AuthService.isOnBoarded != 1
                ? OnboardingScreen()
                : isLoggedIn
                    ? const BottomNav()
                    : const LogInScreen()),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final bool isLoggedIn;
  const SplashScreen({super.key, required this.isLoggedIn});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(AppImages.splashScreenVideoDark)
      ..initialize().then((value) => setState(() {}))
      ..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async {
    _controller.play();

    await Future.delayed(const Duration(seconds: 4));

    AuthService.isOnBoarded != 1
        ? OnboardingScreen()
        : widget.isLoggedIn
            ? openBottomNavBar(context)
            : openLoginScreenWithReplacement(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container());
  }
}
