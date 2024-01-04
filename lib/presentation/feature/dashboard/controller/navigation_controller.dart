import 'dart:core';

import 'package:template/core/constants/app_constants.dart';
import 'package:template/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationController extends GetxController {
  var currentScreenIndex = 0.obs;
  RxList<Widget> screens = <Widget>[].obs;
  List<SalomonBottomBarItem> navigationBarItems = <SalomonBottomBarItem>[].obs;

  @override
  onInit() {
    super.onInit();
    screens.value = [
      kHomeScreen(),
      kTrackVehiclesScreen(),
      kTipperScreen(),
      kReportsScreen(),
    ];
    navigationBarItems = [
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          Constants.assets.dashboardIcon,
          width: 25.w,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        title: const Text('Dashboard'),
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          Constants.assets.gpsmarkerIcon,
          width: 25.w,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        title: const Text('Track'),
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          Constants.assets.tripIcon,
          width: 25.w,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        title: const Text('Trip'),
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          Constants.assets.reportsIcon,
          width: 25.w,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        title: const Text('Report'),
      ),
    ];
  }

  changeScreen(int screenIndex, BuildContext context) {
    onInit();
    currentScreenIndex.value = screenIndex;
  }

  updateScreen({required int index, required Widget screen}) {
    screens[index] = screen;
  }
}
