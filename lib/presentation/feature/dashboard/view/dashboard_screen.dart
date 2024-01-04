import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:template/core/utils/common_methods.dart';
import 'package:template/l10n/gen_l10n/app_localizations.dart';
import 'package:template/presentation/feature/authentication/bindings/authentication_binding.dart';
import 'package:template/presentation/feature/authentication/view/amplify_auth_screen.dart';
import 'package:template/presentation/feature/dashboard/controller/navigation_controller.dart';
import 'package:template/presentation/ui_components/alert_dialog/app_quit_alert_dialog.dart';
import 'package:template/presentation/ui_components/cached_image/circular_cached_image.dart';
import 'package:template/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class DashboardScreen extends GetView<NavigationController> {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (popInvoked) {
          if (popInvoked) {
            getAppQuitConfirmation(context: context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: getUserBar(context: context),
          ),
          body: SafeArea(
            child: Obx(
              () => IndexedStack(
                key: Key(CommonMethods.generateUID()),
                index: controller.currentScreenIndex.value,
                children: controller.screens,
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => SalomonBottomBar(
              margin: EdgeInsets.symmetric(
                horizontal: AppStyle.mediumPadding,
                vertical: AppStyle.smallPadding,
              ),
              currentIndex: controller.currentScreenIndex.value,
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Theme.of(context).colorScheme.surface,
              unselectedItemColor: Theme.of(context).colorScheme.surfaceVariant,
              onTap: (tabIndex) => controller.changeScreen(tabIndex, context),
              items: controller.navigationBarItems,
            ),
          ),
        ));
  }
}

Widget getUserBar({required BuildContext context}) {
  return SizedBox(
    width: Get.width,
    child: Padding(
      padding: EdgeInsets.all(AppStyle.normalPadding),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: getCircularCachedImage(
              imageUrl: '',
              radius: 40.w,
              text: 'Udit',
            ),
          ),
          Expanded(
            child: Text(
              '${AppLocalizations.of(context)?.hello} Udit',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
            ),
          ),
          IconButton(
            //TODO: Temporary
            onPressed: () {
              Amplify.Auth.signOut();
              Get.offAll(
                () => AmplifyAuthUIScreen(),
                binding: AuthenticationBinding(),
              );
            },
            icon: Icon(
              CupertinoIcons.bell_fill,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    ),
  );
}
