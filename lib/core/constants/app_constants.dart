class Constants {
  static Assets assets = Assets();
  static Sentry sentry = Sentry();
}

class Assets {
  static const String pngBaseRoute = 'assets/images/png';
  static const String svgBaseRoute = 'assets/images/svg';

  String appIcon = '$pngBaseRoute/app_icon.png';
  String authIllustration = '$pngBaseRoute/authentication_illustration.png';

  String dashboardIcon = '$svgBaseRoute/dashboard_icon.svg';
  String gpsmarkerIcon = '$svgBaseRoute/gpsmarker_icon.svg';
  String tripIcon = '$svgBaseRoute/trip_icon.svg';
  String reportsIcon = '$svgBaseRoute/reports_icon.svg';
}

class Sentry {
  String endpoint =
      'https://5e1e09b1e47f460e86df8e2786426479@o4505283349381120.ingest.sentry.io/4505346224881664';
  double sampleRate = 1.0;
  bool tracing = true;
}
