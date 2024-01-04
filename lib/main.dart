import 'package:template/core/utils/common_methods.dart';
import 'package:template/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/core_services.dart';
import 'presentation/feature/splash_screen/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CoreService.initaliseServices();

  await SentryFlutter.init(
    (options) {
      options.dsn = Constants.sentry.endpoint;
      options.tracesSampleRate = Constants.sentry.sampleRate;
      options.enableUserInteractionTracing = Constants.sentry.tracing;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 917), //design board dimesion
      builder: (context, child) {
        return GetMaterialApp(
          home: const SplashScreen(),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: CoreService.getAppTheme(),
          darkTheme: CoreService.getAppTheme(),
          locale: CommonMethods.getAppLocale(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // navigatorObservers: [CoreService.getNavigationObserver()],
        );
      },
    );
  }
}
