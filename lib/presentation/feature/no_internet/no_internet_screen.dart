import 'package:template/l10n/gen_l10n/app_localizations.dart';
import 'package:template/presentation/ui_components/alert_dialog/snackbar.dart';
import 'package:template/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.wifi_exclamationmark,
                  size: Get.width / 4,
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppStyle.normalPadding),
                  child: Text(
                    AppLocalizations.of(context)?.noInternet ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 17.sp,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppStyle.mediumPadding),
                  child: FloatingActionButton(
                      elevation: 0.0,
                      child: const Icon(CupertinoIcons.refresh),
                      onPressed: () async {
                        if (await InternetConnection().hasInternetAccess) {
                          Get.back();
                        } else {
                          getSnackBar(
                              message: AppLocalizations.of(Get.context!)
                                      ?.noInternet ??
                                  '');
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
