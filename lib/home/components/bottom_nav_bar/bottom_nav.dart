import 'package:daytrit/home/view/explore/screen/explore_screen.dart';
import 'package:daytrit/home/view/home_screen.dart';
import 'package:daytrit/home/view/notification/notification_screen.dart';
import 'package:daytrit/home/view/profile_screen.dart';
import 'package:daytrit/home/view/shop/shop_screen.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 0;

  final List _pages = [
    HomeScreen(),
    ShopScreen(),
    ExploreScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _pages[_selectedPageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() {
            _selectedPageIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.homeIcon,
                  width: 20,
                  height: 20,
                ),
                label: 'Home',
                activeIcon: SvgPicture.asset(
                  AppImages.blackHomeIcon,
                  width: 20,
                  height: 20,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                ),
                label: 'Shop',
                activeIcon: Icon(
                  Icons.shopping_cart_rounded,
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.searchIcon,
                  width: 20,
                  height: 20,
                ),
                label: 'Explore',
                activeIcon: SvgPicture.asset(
                  AppImages.searchIcon,
                  color: Colors.black,
                  width: 20,
                  height: 20,
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.notificationIcon,
                  width: 20,
                  height: 20,
                ),
                label: 'Notification',
                activeIcon: SvgPicture.asset(
                  AppImages.blackNotificationIcon,
                  width: 20,
                  height: 20,
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profileIcon,
                  width: 20,
                  height: 20,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
