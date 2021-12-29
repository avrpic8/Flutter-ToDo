import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/settings.dart';
import 'package:to_do/app/data/providers/task/settings_provider.dart';

class SettingsController extends GetxController {

  // widget stats
  final isDark = false.obs;
  final locale = false.obs;

  final SettingsProvider settingsProvider;
  late AppSettings settings;

  SettingsController({required this.settingsProvider});


  @override
  void onInit() {
    super.onInit();
    loadParametersSettings();
  }

  void loadParametersSettings() {
    settings = settingsProvider.readAppSettings();
    isDark.value = settings.isDark;
    if(settings.lan == 'en') locale.value = false;
    else locale.value = true;
  }

  void changeTheme(bool newValue) {
    isDark.value = newValue;
    settings.isDark = newValue;
    saveParametersSettings(settings);
    if(isDark.value){
      Get.changeTheme(ThemeData.dark());
    }
    else{
      Get.changeTheme(ThemeData.light());
    }
  }

  void changeLanguage(bool newValue) {
    locale.value = newValue;
    if(locale.value){
      Get.updateLocale(Locale('fa'));
      settings.lan = 'fa';
    }else{
      Get.updateLocale(Locale('en'));
      settings.lan = 'en';
    }
    saveParametersSettings(settings);
  }

  void saveParametersSettings(AppSettings settings){
    settingsProvider.writeAppSettings(settings);
  }
}
