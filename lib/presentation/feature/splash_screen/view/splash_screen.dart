import 'package:template/core/constants/app_constants.dart';
import 'package:template/core/utils/core_services.dart';
import 'package:template/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => CoreService.checkAuthenticationStatus(),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppStyle.normalPadding),
        child: Center(
          child: SizedBox(
            width: Get.width / 2,
            height: Get.height / 4,
            child: Image.asset(Constants.assets.appIcon),
          ),
        ),
      ),
    );
  }
}
