import 'package:template/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

getAppQuitConfirmation({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      title: Text(
        AppLocalizations.of(context)?.exitConfirmation ?? '',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
            ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                Get.back();
                SystemNavigator.pop();
              },
              child: Text(
                AppLocalizations.of(context)?.yes ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            TextButton(
              child: Text(
                AppLocalizations.of(context)?.no ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      ],
    ),
  );
}
