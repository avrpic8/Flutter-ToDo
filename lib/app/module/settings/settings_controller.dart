import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/Settings.dart';
import 'package:to_do/app/data/providers/task/settings_provider.dart';

class SettingsController extends GetxController {
  final isDark = false.obs;
  final locale = false.obs;

  final SettingsProvider settingsProvider;

  SettingsController({required this.settingsProvider});

  void changeTheme(bool newValue) {
    isDark.value = newValue;
    settingsProvider.writeParameters(Settings(isDark: isDark.value));
    if (isDark.value)
      Get.changeTheme(ThemeData.dark());
    else
      Get.changeTheme(ThemeData.light());
    print(settingsProvider.readParameters());
  }

  void changeLanguage(bool newValue) {
    locale.value = newValue;
    if (locale.value) {
      settingsProvider.writeParameters(
          Settings(isDark: isDark.value, locale: Locale('en')));
      Get.updateLocale(Locale('en'));
    }
    else {
      settingsProvider.writeParameters(
          Settings(isDark: isDark.value, locale: Locale('fa')));
      Get.updateLocale(Locale('fa'));
    }
  }
}
