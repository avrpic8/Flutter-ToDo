import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/Settings.dart';
import 'package:to_do/app/data/providers/task/settings_provider.dart';

class SettingsController extends GetxController {
  final isDark = false.obs;
  final locale = false.obs;

  final SettingsProvider settingsProvider;

  SettingsController({required this.settingsProvider});


  @override
  void onInit() {
    super.onInit();
    initParametersSettings();
  }

  void initParametersSettings(){
    bool theme = settingsProvider.readParameters('theme') ?? false;
    if(theme){
      isDark.value = true;
    }else{
      isDark.value = false;
    }

    String lang = settingsProvider.readParameters('lan') ?? 'en';
    if(lang == 'en'){
      locale.value = false;
    }else{
      locale.value = true;
    }
  }

  void changeTheme(bool newValue) {
    isDark.value = newValue;
    settingsProvider.writeParameters('theme', isDark.value);
    if (isDark.value)
      Get.changeTheme(ThemeData.dark());
    else
      Get.changeTheme(ThemeData.light());
    print(settingsProvider.readParameters('theme'));
  }

  void changeLanguage(bool newValue) {
    locale.value = newValue;
    if (!locale.value) {
      settingsProvider.writeParameters('lan', 'en');
      Get.updateLocale(Locale('en'));
    }
    else {
      settingsProvider.writeParameters('lan', 'fa');
      Get.updateLocale(Locale('fa'));
    }
  }
}
