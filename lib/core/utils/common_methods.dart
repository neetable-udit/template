import 'dart:math';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:template/core/utils/local_storage.dart';
import 'package:template/core/utils/storage_keys.dart';
import 'package:template/presentation/feature/authentication/bindings/authentication_binding.dart';
import 'package:template/presentation/feature/authentication/view/amplify_auth_screen.dart';
import 'package:template/presentation/ui_components/alert_dialog/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CommonMethods {
  static String generateUID() {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    final tag = List.generate(
      30,
      (index) => availableChars[random.nextInt(availableChars.length)],
    ).join();

    return tag;
  }

  static Future<void> signoutUser() async {
    try {
      await Amplify.Auth.signOut(
        options: const SignOutOptions(
          globalSignOut: false,
        ),
      );
      LocalStorage.clearAll();
      //TODO: Remove Device

      // NotificationController().removeDevice();
      Get.offAll(
        () => AmplifyAuthUIScreen(),
        binding: AuthenticationBinding(),
      );
    } on AuthException catch (exception) {
      getSnackBar(message: 'Something went wrong');
      CommonMethods.print(exception.message.toString());
    }
  }

  static print(
    message, {
    int methodCount = 2,
    int errorMethodCount = 1,
    bool printTime = false,
  }) {
    Logger(
      printer: PrettyPrinter(
        methodCount: methodCount,
        errorMethodCount: errorMethodCount,
        printTime: printTime,
        colors: true,
        printEmojis: true,
        noBoxingByDefault: false,
      ),
    ).d(message);
  }

  static Locale getAppLocale() {
    String? language = LocalStorage.get(Keys.language);
    if (language == null) {
      return const Locale('en');
    } else {
      return Locale(language);
    }
  }
}
