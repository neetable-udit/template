import 'package:template/core/utils/local_storage.dart';
import 'package:template/core/utils/storage_keys.dart';
import 'package:template/presentation/ui_components/alert_dialog/app_quit_alert_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String languageCode = LocalStorage.get(Keys.language) ?? 'en';
    LocalStorage.save(Keys.language, languageCode == 'en' ? 'hi' : 'en');

    return Scaffold(
      body: GestureDetector(
        onTap: () => getAppQuitConfirmation(context: context),
        child: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
