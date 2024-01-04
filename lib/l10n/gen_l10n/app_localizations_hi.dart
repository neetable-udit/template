import 'app_localizations.dart';

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get hello => 'नमस्ते,';

  @override
  String get exitConfirmation => 'क्या आप निश्चित हैं आपकी बाहर निकलने की इच्छा है?';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get noInternet => 'आपका डिवाइस\nइंटरनेट से कनेक्ट नहीं है';
}
