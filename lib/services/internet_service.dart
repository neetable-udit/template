import 'package:template/l10n/gen_l10n/app_localizations.dart';
import 'package:template/presentation/feature/no_internet/no_internet_screen.dart';
import 'package:template/presentation/ui_components/alert_dialog/snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkService {
  static checkConnectivity() async {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      bool isDeviceConnected = await InternetConnection().hasInternetAccess;

      if (isDeviceConnected) {
        if (Get.context != null) {
          Get.back();
        }
      } else {
        if (Get.context != null) {
          Get.to(() => const NoConnectionScreen());
        }
        getSnackBar(
          message: AppLocalizations.of(Get.context!)?.noInternet ?? '',
        );
      }
    });
  }
}
