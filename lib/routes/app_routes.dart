import 'package:template/presentation/feature/home/view/home_screen.dart';
import 'package:template/presentation/feature/reports/view/reports_screen.dart';
import 'package:template/presentation/feature/tipper/view/tipper_screen.dart';
import 'package:template/presentation/feature/track_vehicle/view/track_vehicle_screen.dart';
import 'package:template/routes/navigation_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget kHomeScreen() => Navigator(
      key: Get.nestedKey(NavigationKeys.home.index),
      onGenerateRoute: (routeSettings) => GetPageRoute(
        page: () => const HomeScreen(),
      ),
    );

Widget kTrackVehiclesScreen() => Navigator(
      key: Get.nestedKey(NavigationKeys.trackVehicle.index),
      onGenerateRoute: (routeSettings) => GetPageRoute(
        page: () => const TrackVehicleScreen(),
      ),
    );

Widget kTipperScreen() => Navigator(
      key: Get.nestedKey(NavigationKeys.tipper.index),
      onGenerateRoute: (routeSettings) => GetPageRoute(
        page: () => const TipperScreen(),
      ),
    );

Widget kReportsScreen() => Navigator(
      key: Get.nestedKey(NavigationKeys.reports.index),
      onGenerateRoute: (routeSettings) => GetPageRoute(
        page: () => const ReportsScreen(),
      ),
    );
