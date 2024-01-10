import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:template/core/utils/local_storage.dart';
import 'package:template/core/utils/storage_keys.dart';
import 'package:template/presentation/feature/authentication/bindings/authentication_binding.dart';
import 'package:template/presentation/feature/authentication/view/amplify_auth_screen.dart';
import 'package:template/presentation/feature/dashboard/bindings/dashboard_bindings.dart';
import 'package:template/presentation/feature/dashboard/view/dashboard_screen.dart';
import 'package:template/services/amplify_service.dart';
import 'package:template/services/internet_service.dart';
import 'package:template/theme/light_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_theme/json_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CoreService {
  static ThemeData getAppTheme({bool authenticationTheme = false}) {
    ThemeData? theme = ThemeDecoder.decodeThemeData(lightTheme);
    return theme ?? ThemeData();
  }

  static FirebaseAnalyticsObserver getNavigationObserver() {
    final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
    );
    return observer;
  }

  static Future<void> initaliseServices() async {
    await GetStorage.init();
    await NetworkService.checkConnectivity();
    await AmplifyService.configureAmplify();
  }

  static checkAuthenticationStatus() async {
    try {
      String userId = (await Amplify.Auth.getCurrentUser()).userId;
      LocalStorage.save(Keys.userId, userId);
      Sentry.configureScope((scope) => scope.setUser(SentryUser(id: userId)));
      // FirebaseAnalytics.instance.setUserId(id: userId);

      String? deviceId = LocalStorage.get(Keys.deviceId);
      String? fcmToken = LocalStorage.get(Keys.fcmToken);

      if (deviceId != null && fcmToken != null) {
        //TODO:Implement Validation of Device

        // DeviceRepository().validateDevice(
        //   deviceId: deviceId,
        //   fcmToken: fcmToken,
        // );

        Get.offAll(
          const DashboardScreen(),
          binding: DashboardBindings(),
        );
      } else {
        //TODO: Temporary Disable Signout

        // CommonMethods.signoutUser();
        Get.offAll(
          const DashboardScreen(),
          binding: DashboardBindings(),
        );
      }
    } on AuthException {
      // FirebaseAnalytics.instance.setUserId(id: 'unauthenticated_user');
      Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: 'unauthenticated_user')),
      );

      Get.offAll(
        () => AmplifyAuthUIScreen(),
        binding: AuthenticationBinding(),
      );
    }
  }
}
