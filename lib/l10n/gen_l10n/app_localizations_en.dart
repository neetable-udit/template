import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello,';

  @override
  String get exitConfirmation => 'Are you sure you want to exit?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get noInternet => 'your device is not connected\nto the internet';
}
